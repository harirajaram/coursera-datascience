corr <- function(directory, threshold = 0){
        completeCases <-complete(directory)
        correlation <-numeric()
        for(i in 1:nrow(completeCases)){
                if (completeCases$nobs[i] > threshold){
                        id <-completeCases$id[i]
                        y <- if (id <10){
                                "00"
                        }else if  (id <100 && id > 9) {
                                "0"
                        } 
                        f<-paste(y,id,".csv",sep = "")
                        z <-read.csv(file.path(directory,f),header = TRUE)
                        subset <-(subset(z,!is.na(sulfate) & !is.na(nitrate)))
                        correlation <-c(correlation,cor(subset$sulfate, subset$nitrate))
                }
        }
        correlation
}