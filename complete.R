#complete function

#Write a function that reads a directory full of files and reports the number of completely observed cases in each data file. 
#The function should return a data frame where the first column is the name of the file 
#and the second column is the number of complete cases.

complete <- function(directory, id = 1:332) {
        listik <- list.files(directory)
        compcases <- data.frame(matrix(NA, nrow = 0, ncol = 2))
a <- data.frame()
        for (i in id) {
                
                path <- paste(directory, "/", listik[i], sep = "")
                file <- read.csv(path)
                good <- sum(complete.cases(file))
                
                add <- c(i, good)
                
                compcases <- rbind(compcases, add)
                colnames(compcases) <- c("id", "nobs")
        }
compcases
}
complete("specdata", 30:25)

