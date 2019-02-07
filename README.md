[![Travis CI Build Status](https://img.shields.io/travis/bd-R/bdchecks.svg?branch=master?style=flat-square&label=Travis+CI)](https://travis-ci.org/bd-R/bdchecks) 
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/bd-R/bdchecks?branch=master&svg=true)](https://ci.appveyor.com/project/bd-R/bdchecks)

# bdchecks
Managing all data checks

Install `bdchecks` with: 

    devtools::install_github("bd-R/bdchecks")

Load with:
    
    library(bdchecks)

Run `shiny` app with:

    runbdchecks()

## Performing data checks

Perform data checks (not exported yet):

    resultDC <- bdchecks::performDataCheck(dataBats)

Check what data checks were performed (default show method):

    resultDC

Export data after data checks (file or R object) (not exported yet):  

    bdchecks::exportDataCheck(resultDC)

Quick glance at data check result (% of records that passed) (not exported yet):  

    # Nice summary
    summary_DC(resultDC)


## Dealing with data checks

Load data checks (DC) into `R` using `getDC()` function. Needs local [`yaml` file](https://github.com/bd-R/bdchecks/blob/master/inst/extdata/dataChecks.yaml):

    DC <- getDC(pathToYAML)

Export DCs from a given `yaml` file to rda and `roxygen2` comments:

    bdchecks:::exportDC(pathToYAML)