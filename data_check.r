# 2017-03-08
# S Ogletree

# function to produce a simple data frame of NA, zeros, and col type

quickDesc <- function(df) {
  l1 <- lapply(df, function(x) sum(x == 0, na.rm = T))
  l2 <- lapply(df, function(x) sum(is.na(x)))
  l3 <- lapply(df, function(x) class(x))

  quickD <- cbind(l2, l1, l3)
  quickD <- as.data.frame(quickD)
  names(quickD) <- c("AreNA", "AreZero", "ColType")
  return(quickD)
}
