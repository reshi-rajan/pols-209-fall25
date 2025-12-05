Mode <- function(x) {
  uniques <- unique(x)
  uniques[which.max(tabulate(match(x, uniques)))]
}


Mode(dataframe$variable)
