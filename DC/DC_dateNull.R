new("dataCheck", name = "dateNull", guid = "41267642-60ff-4116-90eb-499fee2cd83f", 
    meta = new("dataCheckMeta", description = list(Main = "Checks if date feeld is not empty", 
        Fail = "No date information", Pass = "Date information is present"), 
        keywords = "date", question = "Is date feeld not empty", 
        dimension = "Completness", pseudocode = "for dateCols in field\n  result = isNull(year) & isNull(eventDate) & isNull(verbatimEventDate)\n  return(result)\n", 
        source = list(Reference = NULL, CreatedBy = NULL, MaintainedBy = NULL, 
            CreationDate = NULL, ModificationDate = NULL, ModificationHist = NULL), 
        example = list(InputFail = "year=NULL + eventDate=NULL + verbatimEventDate=NULL, year=2010 + eventDate=NULL + verbatimEventDate=NULL", 
            InputPass = "year=2010 + eventDate=2010.01.01 + verbatimEventDate=2010.01.01", 
            OutputFail = FALSE, OutputPass = TRUE)), input = list(
        Target = "year,eventDate,verbatimEventDate", Dependency = list(
            Data = NULL, DataChecks = NULL, Sibling = NULL, Rpackages = NULL)), 
    output = list(Flag = "Invalid", Severity = "Warning", Report = list(
        percentEmpty = TRUE, percentPass = TRUE, Fitness = TRUE, 
        Table = TRUE)), func = expression(FUNC <- function() {
        all(sapply(TARGETS, function(x) !is.null(get(x))))
    }))
