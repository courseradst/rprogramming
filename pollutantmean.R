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

pollutantmean <- function(directory, pollutant, id = 1:332) {
  values <- numeric()
  for(i in id){
    filename <- getfilename(i)
    file <- paste(directory, "/", filename, sep="")
    data <- read.csv(file)
    values <- c(values, data[[pollutant]])
  }
  
  mean(values, na.rm=T)
}

