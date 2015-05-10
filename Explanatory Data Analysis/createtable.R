#base for creating data
## trying to use sqlDF to make it interesting

#install.packages("sqldf");library("sqldf")
## this is equivalelent to the above cmd.
require("sqldf")
## SQLLite to have it in memory.I noticed something interesting,this is much faster than data.table
cachedData <-NULL
# method used to create data
createCachedData <-function(){
        db <- dbConnect(RSQLite::SQLite())
        ## load the data in the table
        dbWriteTable(conn = db,"household_power_consumption.txt",header=TRUE,sep=";",
                     name="project1",overwrite=TRUE,
                     colClasses=c("character", "character", rep("numeric",7)))
        ## get the data by filtering the na
        data <- sqldf("SELECT * FROM project1 WHERE Global_active_power !='?'",connection =db)
        ## disconnecte the db
        dbDisconnect(db)
        ## let us filter the dates now.the other option is we can use the filter of dates in SQL too.
        data$Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
        data$Date <- as.Date(data$Date, "%d/%m/%Y")
        dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
        ## get the dates
        data <- subset(data, Date %in% dates)
       
        return (data)
}