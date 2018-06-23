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

    bdchecks:::shortSummaryDataCheck(resultDC)


## Dealing with data checks

Load data checks (DC) into `R` using `getDC()` function. Needs local [`yaml` file](http://raw.githubusercontent.com/bd-R/bdchecks/master/data/DCtest.yaml):

    DC <- getDC(pathToYAML)

Export DCs from a given `yaml` file to rda and `roxygen2` comments:

    exportDC(pathToYAML)
