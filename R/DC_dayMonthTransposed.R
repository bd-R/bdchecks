new("dataCheck", name = "dayMonthTransposed", guid = "f98a54eb-59e7-44c7-b96f-200e6af1c895", 
    meta = new("dataCheckMeta", description = list(Main = "Checks if day and month information is not transposed", 
        Fail = "The event month is greater than 12 and event day is less than 12 inferring field transpositon", 
        Pass = "The event month and day is feasible"), keywords = "date", 
        question = "Is day and month not switched", dimension = "Conformance", 
        pseudocode = "for day and month in field\n  result = month > 12 and day < 12\n  return(result)\n", 
        source = list(Reference = NULL, CreatedBy = NULL, MaintainedBy = NULL, 
            CreationDate = NULL, ModificationDate = NULL, ModificationHist = NULL), 
        example = list(InputFail = "day=1 + month = 13, day = 12 + month = 31", 
            InputPass = "day=1 + month = 12, day = 31 + month = 1", 
            OutputFail = "Amendment", OutputPass = TRUE)), input = list(
        Target = "day,month", Dependency = list(Data = NULL, 
            DataChecks = "dateNull", Sibling = NULL, Rpackages = NULL)), 
    output = list(Flag = "Invalid", Severity = "Warning", Report = list(
        percentEmpty = TRUE, percentPass = TRUE, Fitness = TRUE, 
        Table = TRUE)), func = expression(FUNC <- function() {
        TARGET1 <= 12 & TARGET2 > 12
    }))
