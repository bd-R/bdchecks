library(bdchecks)
DC <- yaml::yaml.load_file("./data_DC_test.yaml")
dataRaw <- readRDS("./data/dataRaw_chiroptera_Australia.RDS")

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