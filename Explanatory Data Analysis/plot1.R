##load the base
source("createtable.R")
## used to plot the histogram
plot1 <-function(){
        ## check if the data is loaded in cache.if so get it
        if(is.null(cachedData)) {
                cachedData <<- createCachedData()
        }
        
        data <-cachedData
        ## create the png
        png("plot1.png", width=480, height=480)
        ## create the histogream
        hist(data$Global_active_power,
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)",
             ylab="Frequency",
             col="red")
        ## switch of the graphics
        dev.off()
        
}