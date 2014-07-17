## 'directory' is a character vector of length 1 indicating
## the location of the CSV files
getDirectory <- function (directory, id) { 
        
        file <- paste(directory, "/", sprintf("%03d", as.numeric(id)), ".csv", 
                      sep = "")
        ReadFile <- read.csv(file)
        return(ReadFile)
}
## Access to directory put in a function
complete <- function(directory, id = 1:332) {
        df <- data.frame() 
        for(i in id) {   
                ## 'id' is an integer vector indicating the monitor ID numbers
                ## to be used
                data <- getDirectory(directory,i)
                nobs <- nrow(na.omit(data))
                ## Return a data frame of the form:
                ## id nobs
                ## 1  117
                ## 2  1041
                ## ... 
                ## where 'id' is the monitor ID number and 'nobs' is the
                ## number of complete cases 
                df <- rbind(df,data.frame(id=i,nobs=nobs)) 
               
        }
        return(df)
}
