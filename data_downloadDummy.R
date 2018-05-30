# Arguments
taxName  <- "chiroptera"
taxRank  <- "order"
region   <- "Australia"
nRecords <- 5e4

library(rgbif)
library(tidyverse)

# Get region code
# Not sure if suggested greping solution is very safe
codeISO <- subset(isocodes, name == region)$code

# We need nubKey according to #672
# https://github.com/gbif/portal-feedback/issues/672
codeKey <- name_lookup(taxName, rank = taxRank, limit = 1e3) %>%
    .$data %>%
    filter(tolower(order) == taxName & taxonomicStatus == "ACCEPTED") %>%
    select(nubKey) %>%
    na.omit() %>%
    unique()

# Download N records with given arguments
occ_search(orderKey = codeKey, country = codeISO, 
           hasCoordinate = TRUE, limit = nRecords) %>%
    .$data %>%
    saveRDS(paste0("dataRaw_", taxName, "_", region, ".RDS"), 
            compress = FALSE)