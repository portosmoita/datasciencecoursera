## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
getDirectory <- function (directory, id) {
        
        file <- paste(directory, "/", sprintf("%03d", as.numeric(id)), ".csv", 
                      sep = "")
        ReadFile <- read.csv(file)
        return(ReadFile)
}
## Access to directory put in a function
corr <- function(directory, threshold = 0) {
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        TotObs <- complete(directory, 1:332)   
        TotObs <- TotObs[TotObs$nobs > threshold, ]   
        ##selection ids from monitors whose total observations > threshold 
        
        x <- numeric(0)##create empty numeric vector as an output for the loop
        for(i in TotObs$id) { ##loop between choosen monitors and bind them together
            merge <- getDirectory(directory, i)    
            data <- na.omit(merge) ## elimination NA values    
            
            sulfate <- data$sulfate
            nitrate <- data$nitrate ## Column selection
            
            x <- c(x, cor(sulfate, nitrate))
            ## Return a numeric vector of correlations
        }
      return (x)
            
}

