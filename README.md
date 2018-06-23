# bdchecks
Managing all data checks

Install `bdchecks` with: 

    devtools::install_github("bd-R/bdchecks")

Load with:
    
    library(bdchecks)


## Performing data checks

    performDataChecks(dataBats)


## Dealing with data checks

Load data checks (DC) into `R` using `getDC()` function. Needs local [`yaml` file](http://raw.githubusercontent.com/bd-R/bdchecks/master/data/DCtest.yaml):

    DC <- getDC(pathToYAML)

Export DCs from a given `yaml` file to rda and `roxygen2` comments:

    exportDC(pathToYAML)
