

corr <- function(directory, threshold = 0) {
  cors <- numeric()
  df <- complete(directory)
  ids <- df$id[df$nobs > threshold]
  for(i in ids) {
    filename <- getfilename(i)
    file <- paste(directory, "/", filename, sep="")
    data <- read.csv(file)
    completecases <- complete.cases(data$sulfate, data$nitrate)
    datacomplete <- data[completecases, ]
    cors <- c(cors, cor(datacomplete$sulfate, datacomplete$nitrate))
  }
  cors
  #length(ids)
}