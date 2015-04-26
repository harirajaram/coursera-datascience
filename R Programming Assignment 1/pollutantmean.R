pollutantmean <-function(directory,pollutant,id=1:332) {
        sum<-numeric()
        for (counter in id) {
                y <- if (counter <10){
                        "00"
                }else if  (counter <100 && counter > 9) {
                        "0"
                } 
                f<-paste(y,counter,".csv",sep = "")
                z <-read.csv(file.path(directory,f),header = TRUE)
                sum <-c(sum,z[[pollutant]])
        }
        mean(sum,na.rm = TRUE)
}