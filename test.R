dataCheckMeta <- setClass(
    "dataCheckMeta",
    slots = c(
        description = "list",
        keywords    = "character",
        question    = "character",
        dimension   = "character",
        pseudocode  = "character",
        source      = "list",
        example     = "list"))
dataCheck <- setClass(
    "dataCheck",
    slots = c(
        name   = "character",
        guid   = "character",
        meta   = "dataCheckMeta",
        input  = "list",
        output = "list",
        func   = "expression"))
setGeneric("performDC", function(DC, data) standardGeneric("performDC"))
setMethod("performDC", "dataCheck",
    function(DC, data) {

        # TARGETS
        targetNames <- unlist(strsplit(DC@input$Target, ","))
        for(j in seq_along(targetNames)) {
            assign(paste0("TARGET", j), data[, targetNames[j], drop = TRUE])
        }
        if (length(targetNames) == 1) {
            TARGET <- TARGET1
        }
        TARGETS <- ls(pattern = "TARGET\\d+")

        # DEPENDENCIES
        if (!is.null(DC@input$Dependency$Rpackages)) {
            if (!require(DC@input$Dependency$Rpackages, character.only = TRUE)) {
                install.packages(DC@input$Dependency$Rpackages)
            }
                library(DC@input$Dependency$Rpackages, character.only = TRUE)
        }
        if (!is.null(DC@input$Dependency$Data)) {
            dependencies <- unlist(strsplit(DC@input$Dependency$Data, ","))
            for(j in seq_along(dependencies)) {
                assign(paste0("DEPEND", j), eval(parse(text = dependencies[j])))
            }
            if (length(dependencies) == 1) {
                DEPEND <- DEPEND1
            }
            DEPENDS <- ls(pattern = "DEPEND\\d+")
        }
        eval(DC@func)()
})

########################################
# Load DCs
getDC <- function(YAML = "./DC_test.yaml", 
                  exportDC = TRUE,
                  pathDC = "./DC/") {

    DCyaml <- yaml::yaml.load_file(YAML)
    DC <- list()
    for(i in seq_along(DCyaml)) {
        foo <- new("dataCheckMeta",
                   description = DCyaml[[i]]$meta$Description,
                   keywords    = DCyaml[[i]]$meta$Keywords,
                   question    = DCyaml[[i]]$meta$InputQuestion,
                   dimension   = DCyaml[[i]]$meta$Dimension,
                   pseudocode  = DCyaml[[i]]$meta$Pseudocode,
                   source      = DCyaml[[i]]$meta$Source,
                   example     = DCyaml[[i]]$meta$Example)
        bar <- new("dataCheck",
                   name   = DCyaml[[i]]$name,
                   guid   = DCyaml[[i]]$guid,
                   meta   = foo,
                   input  = DCyaml[[i]]$Input,
                   output = DCyaml[[i]]$Output,
                   func   = parse(text = DCyaml[[i]]$Functionality))
        DC[[paste0("DC_", DCyaml[[i]]$name)]] <- bar
        if (exportDC) {
            dput(bar, paste0(pathDC, paste0("DC_", DCyaml[[i]]$name), ".R"),
                 "niceNames")
        }
    }
    return(DC)
}



################################################################################
################################################################################

library(bdchecks)
DC <- getDC()

dataRaw <- readRDS("./data/dataRaw_chiroptera_Australia.RDS")
lapply(DC, performDC, dataRaw)


wantedDC    <- sub("^DC_", "", names(DC))
performedDC <- character(length(DC))
while(!all(wantedDC %in% performedDC)) {
    for(i in seq_along(DC)) {
        # If there are no dependencies then it's safe to run DC
        DCsafe <- is.null(DC[[i]]@input$Dependency$DataChecks)
        if (!DCsafe) {
            # Check if required dependencies are already performed
            DCsafe <- DC[[i]]@input$Dependency$DataChecks %in% performedDC
        }

        if (DCsafe & !wantedDC[i] %in% performedDC) {
            print(i)
            performDC(DC[[i]], dataRaw)
            performedDC[i] <- wantedDC[i]
        }
    }
}