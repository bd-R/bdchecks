[![Travis CI Build Status](https://img.shields.io/travis/bd-R/bdchecks.svg?branch=master?style=flat-square&label=Travis+CI)](https://travis-ci.org/bd-R/bdchecks) 
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/bd-R/bdchecks?branch=master&svg=true)](https://ci.appveyor.com/project/bd-R/bdchecks)
[![Coverage Status](https://img.shields.io/codecov/c/github/bd-R/bdchecks/master.svg)](https://codecov.io/github/bd-R/bdchecks?branch=master)   
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/bdchecks)](https://cran.r-project.org/package=bdchecks) 
[![CRAN_Download_Badge](https://cranlogs.r-pkg.org/badges/grand-total/bdchecks)](https://cran.r-project.org/package=bdchecks) 

# bdchecks
Managing all data checks

Install `bdchecks` with: 

    install.packages("bdchecks")

Or for development version:

    devtools::install_github("bd-R/bdchecks")

Load with:
    
    library(bdchecks)

## Performing data checks

Perform data checks (not exported yet):

    result <- bdchecks::perform_dc(data_bats)

Check what data checks were performed (default show method):

    result

Quick glance at data check result (% of records that passed) (not exported yet):  

    # Nice summary
    summary_dc(result)

## Dealing with new data checks

This is a recommended workflow to add new data checks:

1. Load libraries 

```{r}
library(bdchecks)
library(devtools) # To install new version of a package
library(usethis) # To export data.checks object
```

2. Check if original build works

```{r}
check()
```

3. Create new data check  

3.1 Add meta information to `./inst/extdata/data_check.yaml` file  
3.2 Add data check function to `./R/` directory (file should be named after a data check, e.g. `dc_checkthis.R`). First argument to a data check function must be a vector (column) to perform data check on.  
3.3 Add test data to `./inst/extdata/data_test.yaml`

4. Export new data check

```{r}
install() # To have new check in `system.file("extdata/data_check.yaml")`
data.checks <- bdchecks:::datacheck_info_export() # export documentation and combines new check with old ones
use_data(data_taxonrank, data_countries, data.checks, data_bats, overwrite = TRUE, internal = TRUE) # exports old (and new data checks)
document() # document new check to `Rd`
install() # install package with a new check
```

5. Test if everything works

```{r}
perform_test_dc(summary = TRUE) # perform tests for data checks
check() # perform general check
```

6. Post-incorporation

6.1 Increase version (and date) in `DESCRIPTON`  
6.2 Run `git add` and `git commit` with message: "v0.x.x Added name_of_check data check"