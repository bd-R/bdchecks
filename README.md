# bdchecks
Managing all data checks

Install `bdchecks` with: 

    devtools::install_github("bd-R/bdchecks")

Load with:
    
    library(bdchecks)


## Performing data checks

Perform data checks (not exported yet):

    resultDC <- bdchecks:::performDataCheck(dataBats)

Check what data checks were performed (default show method):

    resultDC

Export data after data checks (file or R object) (not exported yet):  

    bdchecks:::exportDataCheck(resultDC)

Quick glance at data check result (% of records that passed) (not exported yet):  

    # Nice output to terminal
    bdchecks:::shortSummaryDataCheck(resultDC)
    # Output as data frame that can be parsed
    bdchecks:::shortSummaryDataCheck(resultDC, fancy = FALSE)
    # Output to a file
    bdchecks:::shortSummaryDataCheck(resultDC, export = TRUE)


## Dealing with data checks

Load data checks (DC) into `R` using `getDC()` function. Needs local [`yaml` file](http://raw.githubusercontent.com/bd-R/bdchecks/master/data/DCtest.yaml):

    DC <- getDC(pathToYAML)

Export DCs from a given `yaml` file to rda and `roxygen2` comments:

    exportDC(pathToYAML)

# Misc


- Add more DC with multiple targets and different flags.   
- Implement filtering method for flags (add flag to DC result).   
- Document.   
- Add info about not performed data checks to DCresult.   
- I need to rethink what functions returns as amended functions should also return modified data (now it works only with warning TRUE/FALSE).  
- performDC checks only for first colnames and quits (doesn't give chance for other ones)   
- Add info to DCresult about failed DC