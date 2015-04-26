complete <- function(directory, id = 1:332) {
        count <- 1
        finalValue <-data.frame(id=numeric(),nobs=numeric())
        
        for (counter in id) {
                y <- if (counter <10){
                        "00"
                }else if  (counter <100 && counter > 9) {
                        "0"
                }
                f<-paste(y,counter,".csv",sep = "")
                z <-read.csv(file.path(directory,f),header = TRUE)
                subset <-(subset(z,!is.na(sulfate) & !is.na(nitrate)))
                len <-0
                id <-z[["ID"]]
                if(length(complete.cases(subset))>0){
                        len <-nrow(subset)
                        id <-subset[["ID"]]
                        
                }
                result <-data.frame(id=id,nobs=len)
                result <- result[1,]
                finalValue <- rbind(finalValue, result)
                count <-count + 1
                
                
        }
        finalValue
}