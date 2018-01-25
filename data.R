#pollutantmean fucntion

#Write a function named 'pollutantmean' that calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. 
#The function 'pollutantmean'takes three arguments: 'directory', 'pollutant', and 'id'. Given a vector monitor ID numbers, 
#'pollutantmean' reads that monitors' particulate matter data from the directory specified 
#in the 'directory' argument and returns the mean of the pollutant across all of the monitors, 
#ignoring any missing values coded as NA

pollutantmean <- function(directory, pollutant, id = 1:332) {
        listik <- list.files(directory)
        pollutlist <- data.frame(id = character(0), max1 = numeric(0), max2 = numeric(0))  
        for (i in id) {
                
                path <- paste(directory, "/", listik[i], sep = "")
                file <- read.csv(path)
                pollutlist <- rbind(pollutlist, file[pollutant])
                bad <- is.na(pollutlist[pollutant])
        }
        mean(pollutlist[!bad])
}
pollutantmean("specdata", "sulfate", 1)


