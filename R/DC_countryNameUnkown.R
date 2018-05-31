new("dataCheck", name = "countryNameUnkown", guid = "69b2efdc-6269-45a4-aecb-4cb99c2ae134", 
    meta = new("dataCheckMeta", description = list(Main = "Checks if given country code name is known", 
        Fail = "Country name (dwc:country) not in vocabulary", 
        Pass = "Country name (dwc:country) is in vocabulary"), 
        keywords = "country, geo", question = "Is country known", 
        dimension = "Conformance", pseudocode = "for entry in field\n  result = entry %in% dictionary\n  return(result)\n", 
        source = list(Reference = NULL, CreatedBy = NULL, MaintainedBy = NULL, 
            CreationDate = NULL, ModificationDate = NULL, ModificationHist = NULL), 
        example = list(InputFail = "xxx, AUST, 1", InputPass = "AUS,JP", 
            OutputFail = FALSE, OutputPass = TRUE)), input = list(
        Target = "countryCode", Dependency = list(Data = "isocodes$code", 
            DataChecks = NULL, Sibling = NULL, Rpackages = "rgbif")), 
    output = list(Flag = "Invalid", Severity = "Warning", Report = list(
        percentEmpty = TRUE, percentPass = TRUE, Fitness = TRUE, 
        Table = TRUE)), func = expression(FUNC <- function() {
        result <- TARGET %in% DEPEND
        return(result)
    }))
