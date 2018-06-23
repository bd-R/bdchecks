# DONE
setMethod("show", "dataCheckFlag",
    function(object) {
        res <- lapply(object@flags, function(x) {
            data.frame(check = x@name, target = x@target)
        })
        res <- do.call(rbind, res)
        cli::cat_line(format(res$check), " -> ", res$target)
    }
)

# DONE
# !!! Dont know if I should export this function out of method
setGeneric("exportDataCheck", function(DCresult, writeFile = FALSE, file = "result.csv", verbose = TRUE) {
    standardGeneric("exportDataCheck")
})
setMethod("exportDataCheck", "dataCheckFlag",
    function(DCresult, writeFile = FALSE, file = "result.csv", verbose = TRUE) {
        if (writeFile) {
            fileE <- file.exists(file)
            if (verbose) {
                if (fileE) {
                    message(paste("Overwritten", file))
                } else {
                    message(paste("Created", file))
                }
            }
            write.csv(DCresult@dataMod, file)
        } else {
            return(DCresult@dataMod)
        }
})


# DONE
setGeneric("shortSummaryDataCheck", function(DCresult) {
    standardGeneric("shortSummaryDataCheck")
})
setMethod("shortSummaryDataCheck", "dataCheckFlag",
    function(DCresult) {
        res <- lapply(DCresult@flags, function(x) {
            data.frame(name = x@name, passed = paste(round(mean(x@result) * 100, 2), "%"))
        })
        res <- do.call(rbind, res)
        cli::cat_bullet(format(res$name), ": ", res$passed)
})



setGeneric("filterDataCheck", function(DCresult, DC = NULL) {
    standardGeneric("filterDataCheck")
})
setMethod("filterDataCheck", "dataCheckFlag",
    function(DCresult, DC = NULL) {
        foo <- do.call(cbind, lapply(DCresult@flags, function(x) `@`(x, result)))
        if (!is.null(DC)) {
            foo <- matrix(foo[, DCresult@DC %in% DC], ncol = length(DC))
        }
        DCresult@dataMod <- DCresult@dataMod[rowSums(!foo) == 0, ]
        DCresult
})



setGeneric("longSummaryDataCheck", function(DCresult) {
    standardGeneric("longSummaryDataCheck")
})
setMethod("longSummaryDataCheck", "dataCheckFlag",
    function(DCresult) {
        library(ggplot2)
        res <- list()
        pdf()
        for(i in seq_along(DCresult@flags)) {
            name <- DCresult@flags[[i]]@name
            target <- sub(",.*", "", DCresult@flags[[i]]@target)
            pd <- data.frame(x = DCresult@flags[[i]]@result)
            pd2 <- data.frame(table(pd))
            pd2$ID <- ifelse(as.logical(pd2$pd), "Passed", "Failed")
            pd2$per <- paste0(round(pd2$Freq * 100 / sum(pd2$Freq), 1), "%")
            pd2$ID <- factor(pd2$ID, c("Passed", "Failed"))
            p1 <- ggplot(pd2, aes(ID, Freq, fill = ID)) +
                geom_bar(stat = "identity", position = "dodge",
                         width = 0.8, color = "black") +
                geom_text(aes(label = per), vjust = -1) +
                scale_fill_brewer(palette = "Set2") +
                labs(title = paste("Data check:", name),
                     subtitle = paste("Target column:", target),
                     x = NULL,
                     y = "# records",
                     fill = NULL) +
                theme_classic() +
                theme(axis.ticks = element_blank(),
                      legend.position = "none")
            pd3 <- data.frame(x = table(DCresult@dataOrig[!pd$x, target]))
            if (nrow(pd3) > 0) {
                colnames(pd3) <- c("ID", "Freq")
                pd3$per <- paste0(round(pd3$Freq * 100 / sum(pd3$Freq), 1), "%")
                p2 <- ggplot(pd3, aes(ID, Freq, fill = ID)) +
                    geom_bar(stat = "identity", position = "dodge",
                             width = 0.8, color = "black") +
                    geom_text(aes(label = per), vjust = -1) +
                    labs(title = paste("Data check:", name),
                         subtitle = paste("Failed targets in", target),
                         x = NULL,
                         y = "# records",
                         fill = NULL) +
                    theme_classic() +
                    theme(axis.ticks = element_blank(),
                          legend.position = "none")
                # res[[i]] <- 
                egg::ggarrange(p1, p2, ncol = 2)
            } else {
                # res[[i]] <- 
                egg::ggarrange(p1, ncol = 2)
            }
        }
        dev.off()
})