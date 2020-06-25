corr <- function(directory, threshold = 0) {
  
  # Using the paste() to to read the CSV file names and appending the 
  # corresponding number of ZEROs based on the id for example if id is 001.csv
  # then we have appended two Zeros in the paste function, if it was 010.csv
  # then have appended  one zero in the front
  
  correlationVector = NULL 
  id <- 1:332
  for (i in id)
  {           
    if (i <10) { 
      data <- read.csv(paste("00", as.character(i), ".csv", sep=""),
                       header = TRUE,
                       na.strings=c("NA","NaN", " "))
    }
    
    else if (i>=10 & i<100) {
      data <- read.csv(paste("0", as.character(i), ".csv", sep=""),
                       header = TRUE,
                       na.strings=c("NA","NaN", " "))
    }
    
    else{ 
      data <- read.csv(paste(as.character(i), ".csv", sep=""),
                       header = TRUE,
                       na.strings=c("NA","NaN", " "))
    }
    data = na.omit(data) 
    
    if (nrow(data) > threshold) {
      correlationVector = c(correlationVector, cor(data[,2], data[,3]))
    }
  }
  return (correlationVector)
}

#Sample Test results
# > cr <- corr("specdata", 150)
# > head(cr);
# [1] -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667 -0.07588814
# > summary(cr)
# Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# -0.21057 -0.04999  0.09463  0.12525  0.26844  0.76313 
# > cr <- corr("specdata", 400)
# > head(cr);
# [1] -0.01895754 -0.04389737 -0.06815956 -0.07588814  0.76312884 -0.15782860
# > summary(cr)
# Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# -0.17623 -0.03109  0.10021  0.13969  0.26849  0.76313 
# > length(cr)
# [1] 127
# > cr <- corr("specdata", 5000)
# > head(cr); summary(cr) ; length(cr)
# NULL
# Length  Class   Mode 
# 0   NULL   NULL 
# [1] 0
# > cr <- corr("specdata")
# > head(cr); summary(cr) ; length(cr)
# [1] -0.22255256 -0.01895754 -0.14051254 -0.04389737 -0.06815956 -0.12350667
# Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
# -1.00000 -0.05282  0.10718  0.13684  0.27831  1.00000 
# [1] 323