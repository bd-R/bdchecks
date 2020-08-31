# cleaning_table exists in the environment
foo <- cleaning_table
colnames(foo) <- foo[1,]
foo <- foo[-c(1:2),]
rownames(foo) <- gsub(" ", "_", foo$actual_function)
foo$actual_function <- NULL
############### Proof of concept #############################
input <- head(data_bats, n = 20)$eventDate
i <- "eventdate_inrange"
cleaning_parts <- foo[i,] %>%
  .[which(!is.na(t(foo[i,])))] %>%
  sort() %>%
  colnames()

full_string <- "input"
for (i in seq_along(cleaning_parts)) {
  full_string <- c(full_string, paste(" %>%", cleaning_parts[i]))
}
full_string <- paste(full_string, collapse = "")

clean_input <- eval(parse(text = full_string))

############### meta function draft #####################
#https://stackoverflow.com/questions/15595478/how-to-get-the-name-of
#-the-calling-function-inside-the-called-routine

# in progress!!

# meta_clean <- function(input = NULL) {
# }
