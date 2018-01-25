#corr function

#Write a function that takes a directory of data files and a threshold for complete cases 
#and calculates the correlation between sulfate and nitrate for monitor locations where 
#the number of completely observed cases (on all variables) is greater than the threshold. 
#The function should return a vector of correlations for the monitors that meet the threshold requirement. 
#If no monitors meet the threshold requirement, then the function should return a numeric vector of length 0. 



corr <- function(directory, threshold = 0) {
        listik <-list.files(directory)
        correlation <- numeric(0)
        #browser()
        nobsdf <- complete(directory)
        nobsdf <- nobsdf[nobsdf$nobs > threshold, ]
        for(i in nobsdf$id) {
                file <- read.csv(paste(directory, "/", listik[i], sep = ""))
                correlation <- c(correlation, cor(file$sulfate, file$nitrate, use = "pairwise.complete.obs"))
        }
        correlation
}
cr <- corr("specdata")
summary(cr)