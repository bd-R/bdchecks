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
setGeneric("performDC", function(DC) standardGeneric("performDC"))
setMethod("performDC", "dataCheck",
    function(DC) {

        # TARGETS
        targetNames <- unlist(strsplit(DC@input$Target, ","))
        for(j in seq_along(targetNames)) {
            assign(paste0("TARGET", j), dataRaw[, targetNames[j], drop = TRUE])
        }
        if (length(targetNames) == 1) {
            TARGET <- TARGET1
        }

        # DEPENDENCIES
        # pacman Gives
  #       Error in eval(match.call()[[2]]) : 
  # trying to get slot "input" from an object of a basic class ("list") with no slots
        # if (!is.null(DC@input$Dependency$Rpackages)) {
              library(DC@input$Dependency$Rpackages, character.only = TRUE)
        #     pacman::p_load(DC@input$Dependency$Rpackages, character.only = TRUE)
        # }
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

DC <- yaml::yaml.load_file("./data_DC_test.yaml")
# dataRaw <- readRDS("./dataRaw_chiroptera_Australia.RDS")

for(i in seq_along(DC)) {
    foo <- new("dataCheckMeta",
               description = DC[[i]]$meta$Description,
               keywords    = DC[[i]]$meta$Keywords,
               question    = DC[[i]]$meta$InputQuestion,
               dimension   = DC[[i]]$meta$Dimension,
               pseudocode  = DC[[i]]$meta$Pseudocode,
               source      = DC[[i]]$meta$Source,
               example     = DC[[i]]$meta$Example)
    bar <- new("dataCheck",
               name   = DC[[i]]$name,
               guid   = DC[[i]]$guid,
               meta   = foo,
               input  = DC[[i]]$Input,
               output = DC[[i]]$Output,
               func   = parse(text = DC[[i]]$Functionality))
    assign(paste0("DC_", DC[[i]]$name), bar)
}
performDC(DC_countryNameUnkown)