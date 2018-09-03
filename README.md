[![Travis CI Build Status](https://img.shields.io/travis/bd-R/bdchecks.svg?branch=master?style=flat-square&label=Travis+CI)](https://travis-ci.org/bd-R/bdchecks) 
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/bd-R/bdchecks?branch=master&svg=true)](https://ci.appveyor.com/project/bd-R/bdchecks)

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

    # Nice summary
    <summary></summary>(resultDC)


## Dealing with data checks

Load data checks (DC) into `R` using `getDC()` function. Needs local [`yaml` file](http://raw.githubusercontent.com/bd-R/bdchecks/master/data/DCtest.yaml):

    DC <- getDC(pathToYAML)

Export DCs from a given `yaml` file to rda and `roxygen2` comments:

    exportDC(pathToYAML)

# Misc

## Todo

### Main
- Output from different flag types (ie modified data)  
- Shiny for filtering DC result  
- Add information about failed DC  

### Other
- PerformDC checks only if first colname is present and quits (doesn't give chance for other ones)   
- Export summary as pdf (almost as a presentation) - change long output  
- Test DC/filtering with more data (eg 1e6 rows)?   
- Add computing time to DC  
- Add DC filtering info (history) shiny     
- Shiny app idea: upload data and yaml   
- Shiny app idea: create your own data check and yaml :)  
- In filtering add test for all selection (passed, failed, missing)  

## Questions
- Were to put/get external DC data (vocabularies)?   
- What to do with dependency if data check failed?  
