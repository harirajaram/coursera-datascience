##load the base
source("createtable.R")
## used to plot the line chart
plot2 <-function(){
        ## check if the data is loaded in cache.if so get it
        if(is.null(cachedData)) {
                cachedData <<- createCachedData()
        }
        data <-cachedData
        ## create the png
        png("plot2.png", width=480, height=480)
        ## create the line chart
        plot(data$Time, data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
        ## switch of the graphics
        dev.off()
        
}