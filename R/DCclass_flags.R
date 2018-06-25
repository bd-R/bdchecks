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
setGeneric("shortSummaryDataCheck", function(DCresult, fancy = TRUE, export = FALSE, file = "./DCresult.csv") {
    standardGeneric("shortSummaryDataCheck")
})
setMethod("shortSummaryDataCheck", "dataCheckFlag",
    function(DCresult, fancy, export, file) {
        res <- lapply(DCresult@flags, function(x) {
            data.frame(check = x@name, target = x@target,
                       passed = sum(x@result, na.rm = TRUE) / length(x@result),
                       failed = sum(!x@result, na.rm = TRUE) / length(x@result),
                       missing = mean(is.na(x@result)))
        })
        res <- do.call(rbind, res)
        res$check <- as.character(res$check)
        res$target <- as.character(res$target)
        if (export) {
            write.csv(res, file, quote = FALSE, row.names = FALSE)
        } else {
            if (fancy) {
                cli::cat_bullet(format(c("Data check", res$check)), 
                                " -> ", format(c("Target", res$target)), 
                                " : ", format(c("Passed", paste0(round(res$passed * 100, 2), "%"))), 
                                "   ",  format(c("Failed", paste0(round(res$failed * 100, 2), "%"))), 
                                "   ",  format(c("Missing", paste0(round(res$missing * 100, 2), "%"))))
            } else {
                res
            }
        }
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
        library(reshape2)
        pdf()
        for(x in DCresult@flags) {
            res <- data.frame(
                Passed = sum(x@result, na.rm = TRUE) / length(x@result),
                Failed = sum(!x@result, na.rm = TRUE) / length(x@result),
                Missing = mean(is.na(x@result)))
            res <- melt(res)
            res$variable <- factor(res$variable, c("Passed", "Failed", "Missing"))

            p1 <- 
            ggplot(res, aes(variable, value * length(x@result), fill = variable)) +
                geom_bar(stat = "identity", position = "dodge",
                         width = 0.8, color = "black") +
                geom_text(aes(label = paste0(round(res$value, 2) * 100, "%")), vjust = -1) +
                scale_fill_manual(values = c("#7fff7f", "#ff7f7f", "#ffbf7f")) +
                labs(title = paste("Data check:", x@name),
                     subtitle = paste("Target column:", x@target),
                     x = NULL,
                     y = "# records",
                     fill = NULL) +
                theme_classic() +
                theme(axis.ticks = element_blank(),
                      panel.grid.major.y = element_line(size = 0.1, color = "black"), 
                      legend.position = "none")
            # pd3 <- data.frame(x = table(DCresult@dataOrig[!pd$x, target]))
            # if (nrow(pd3) > 0) {
            #     colnames(pd3) <- c("ID", "Freq")
            #     pd3$per <- paste0(round(pd3$Freq * 100 / sum(pd3$Freq), 1), "%")
            #     p2 <- ggplot(pd3, aes(ID, Freq, fill = ID)) +
            #         geom_bar(stat = "identity", position = "dodge",
            #                  width = 0.8, color = "black") +
            #         geom_text(aes(label = per), vjust = -1) +
            #         labs(title = paste("Data check:", name),
            #              subtitle = paste("Failed targets in", target),
            #              x = NULL,
            #              y = "# records",
            #              fill = NULL) +
            #         theme_classic() +
            #         theme(axis.ticks = element_blank(),
            #               legend.position = "none")
            #     # res[[i]] <- 
            #     egg::ggarrange(p1, p2, ncol = 2)
            # } else {
                # res[[i]] <- 
                egg::ggarrange(p1, ncol = 2)
            # }
        }
        dev.off()
})