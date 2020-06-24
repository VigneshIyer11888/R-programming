pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of  the pollutant for which we will calcultate the
  ## mean; either "sulfate" or "nitrate"
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result
  
  pollutantfiles <- list.files(directory, full.names = TRUE)
  pollutantdatas <- data.frame()
  for (i in id){
    pollutantdatas <- rbind(pollutantdatas, read.csv(pollutantfiles[i]))
  }
  mean(pollutantdatas[,pollutant], na.rm=1)
}

  ## while running the function and specifying the values for the arguments
  ## you need to supply the values to both the "directory" and the "pollutant"
  ## argument.
  ## given below are test results
  # >pollutantmean(directory = "../specdata/", pollutant = "nitrate", 70:72)
  # [1] 1.706047
  # > pollutantmean(directory = "../specdata/", pollutant = "nitrate", 23)
  # [1] 1.280833
  # > pollutantmean(directory = "../specdata/", pollutant = "sulfate", 1:10)
  # [1] 4.064128  