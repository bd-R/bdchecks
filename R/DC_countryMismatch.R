new("dataCheck", name = "countryMismatch", guid = "b23110e7-1be7-444a-a677-cdee0cf4330c", 
    meta = new("dataCheckMeta", description = list(Main = "Checks if country name matchs ISO code", 
        Fail = "Country name (dwc:country) and ISO country code (dwc:countryCode) do not match", 
        Pass = "Country name (dwc:country) and ISO country code (dwc:countryCode) match"), 
        keywords = "country, geo", question = "Does contry name match country code", 
        dimension = "Consistency", pseudocode = "for countryName & countryCode in field\n  result = countryName == countryCode\n  return(result)\n", 
        source = list(Reference = NULL, CreatedBy = NULL, MaintainedBy = NULL, 
            CreationDate = NULL, ModificationDate = NULL, ModificationHist = NULL), 
        example = list(InputFail = "AUS AUST, AUS JP", InputPass = "AUS AUS, JP JP", 
            OutputFail = FALSE, OutputPass = TRUE)), input = list(
        Target = "country,countryCode", Dependency = list(Data = "isocodes$name,isocodes$code", 
            DataChecks = NULL, Sibling = NULL, Rpackages = "rgbif")), 
    output = list(Flag = "Invalid", Severity = "Warning", Report = list(
        percentEmpty = TRUE, percentPass = TRUE, Fitness = TRUE, 
        Table = TRUE)), func = expression(FUNC <- function() {
        foo <- sapply(TARGET1, function(x) which(DEPEND1 == x))
        bar <- sapply(TARGET2, function(x) which(DEPEND2 == x))
        as.vector(foo == bar)
    }))
