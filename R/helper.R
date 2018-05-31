# Load DCs
getDC <- function(YAML = "data_DC_test.yaml", 
                  exportDC = TRUE,
                  pathDC = "./R/") {

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
            dput(bar, paste0("./R/", paste0("DC_", DCyaml[[i]]$name), ".R"),
                 "niceNames")
        }
    }
    return(DC)
}