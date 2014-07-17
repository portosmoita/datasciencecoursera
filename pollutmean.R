
pollutantmean <- function (directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        filenames <- list.files(directory, full.names = TRUE) ##create a list of files
        bind_data <- data.frame()##create empty data.frame as an output for the loop
        for(i in id) { ##loop between choosen monitors and bind them together
                bind_data <- rbind(bind_data, read.csv(filenames[i]))
        }
        mean (bind_data[[pollutant]], na.rm = TRUE)
}
