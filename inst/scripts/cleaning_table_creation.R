############# input from bdchecks_logic google sheets ###########
foo <- read.csv('~/Desktop/cleaning.csv')[,c(2,9:15)]
colnames(foo) <- c(
  'name', 
  'date_format_conversion', 
  'POSIXct_conversion', 
  'all_spaces_removal', 
  'numeric_conversion', 
  'trimming_spaces_from_ends', 
  'conversion_to_lower_case', 
  'delimiter_removal'
)
actual_function <- t(data.matrix(c(
  'actual_function', 
  '{suppressWarnings(lubridate::as_date(., format = "%Y-%m-%d"))}', 
  'as.POSIXct()', 
  'gsub(" ", "", .)', 
  '{suppressWarnings(as.numeric(.))}', 
  'trimws()', 
  'tolower()', 
  'gsub("_| |\\.|-", "", .)'
)))
actual_function <- rbind(
  data.frame(actual_function),
  data.frame(t(data.matrix(c("comments", rep(NA, 7)))))
)
colnames(actual_function) <- c(
  'name', 
  'date_format_conversion', 
  'POSIXct_conversion', 
  'all_spaces_removal', 
  'numeric_conversion', 
  'trimming_spaces_from_ends', 
  'conversion_to_lower_case', 
  'delimiter_removal'
)
cleaning_table <- rbind(data.frame(actual_function), foo)