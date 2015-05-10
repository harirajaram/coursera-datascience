##load the base
source("createtable.R")
## used to plot the line chart
plot3 <- function() {
        ## check if the data is loaded in cache.if so get it
        if(is.null(cachedData)) {
                cachedData <<- createCachedData()
        }
        data <-cachedData
        ## create the png
        png("plot3.png", width=480, height=480)
        ## create the line chart
        plot(data$Time, data$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
        lines(data$Time, data$Sub_metering_2, col="red")
        lines(data$Time, data$Sub_metering_3, col="blue")
        legend("topright",
               col=c("black", "red", "blue"),
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty=1)
        ## switch of the graphics
        dev.off()
}