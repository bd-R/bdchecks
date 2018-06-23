# devtools::document();devtools::install()
library(bdchecks)

dataBats$country[1:100] <- "Canada"
dataBats$country[150:200] <- "Japan"

DCresult <- performDataCheck(dataBats)




class(DCresult)
DCresult

dataAfterDC <- exportDataCheck(DCresult)
class(dataAfterDC)
exportDataCheck(DCresult, writeFile = TRUE, file = "tmp_result.csv")


shortSummaryDataCheck(DCresult)
longSummaryDataCheck(DCresult)


nrow(dataBats)

DCresultfilt <- filterDataCheck(DCresult)
exportDataCheck(DCresultfilt)

DCresultfilt <- filterDataCheck(DCresult, "dateNull")
exportDataCheck(DCresultfilt)






