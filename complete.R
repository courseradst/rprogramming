getfilename <- function(n) {
  if(n < 10){
    paste("00", n, ".csv", sep="")
  }
  else if(n >= 10 && n < 100) {
    paste("0", n, ".csv", sep="")
  }
  else {
    paste(n, ".csv", sep="")
  } 
}

complete <- function(directory, id = 1:332) {
  counts <- integer()
  for(i in id) {
    filename <- getfilename(i)
    file <- paste(directory, "/", filename, sep="")
    data <- read.csv(file)
    counts <- c(counts, sum(complete.cases(data$sulfate, data$nitrate)))
  }
  df <- data.frame(id, counts)
  names(df) <- c("id", "nobs")
  df
}
