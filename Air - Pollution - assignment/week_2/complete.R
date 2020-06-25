complete <- function(directory, id = 1:332){
  
  # Important note I have specified the relative path of the directory 
  # kindly specify relative path according to the folder location where 
  # the specdata folder is located
  
  pollutantfiles <- list.files(directory, full.names = TRUE)
  completedCases <- data.frame()
  for(i in id){
    allpollutantdata <- data.frame(read.csv(pollutantfiles[i],header = TRUE))
    nobs<- data.frame()
    nobs <- sum(complete.cases(allpollutantdata))
    completedCases <- rbind(completedCases, data.frame(i,nobs))
  }
  completedCases
}

  ## Test results
  # > complete(directory = "../specdata", c(2, 4, 8, 10, 12))
  # i nobs
  # 1  2 1041
  # 2  4  474
  # 3  8  192
  # 4 10  148
  # 5 12   96
  # > complete(directory = "../specdata", 40:50)
  # i nobs
  # 1  40   21
  # 2  41  227
  # 3  42   60
  # 4  43   74
  # 5  44  283
  # 6  45  424
  # 7  46   89
  # 8  47  540
  # 9  48   62
  # 10 49  473
  # 11 50  459