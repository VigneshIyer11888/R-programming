pollutantmean <- function(directory, pollutant, id = 1:332) {
  
    # Important note I have specified the relative path of the directory 
  # kindly specify relative path according to the folder location where 
  # the specdata folder is located
  
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