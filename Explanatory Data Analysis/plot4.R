##load the base
source("createtable.R")
## used to plot the 4 line charts
plot4 <- function() {
        ## check if the data is loaded in cache.if so get it
        if(is.null(cachedData)){
                cachedData <<- createCachedData()
        }
        data <-cachedData
        ## create the png
        png("plot4.png", width=480, height=480)
        ## divide the frame 2 * 2
        par(mfrow=c(2,2))
        ## create the line chart
        plot(data$Time, data$Global_active_power,
             type="l",
             xlab="",
             ylab="Global Active Power")
        plot(data$Time, data$Voltage, type="l",
             xlab="datetime", ylab="Voltage")
        plot(data$Time, data$Sub_metering_1, type="l", col="black",
             xlab="", ylab="Energy sub metering")
        lines(data$Time, data$Sub_metering_2, col="red")
        lines(data$Time, data$Sub_metering_3, col="blue")
        
        legend("topright",
               col=c("black", "red", "blue"),
               c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty=1,
               box.lwd=0)
        plot(data$Time, data$Global_reactive_power, type="n",
             xlab="datetime", ylab="Global_reactive_power")
        lines(data$Time, data$Global_reactive_power)
        ## switch of the graphics
        dev.off()
}