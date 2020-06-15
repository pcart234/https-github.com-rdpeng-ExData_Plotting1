library(dplyr)
library(sqldf)
library(lubridate)
P_data1 <- read.table("household_power_consumption.txt",header = TRUE
                    ,stringsAsFactors = FALSE, sep = ";", col.names = c("Date","Time" 
                                                           ,"Global_active_power","Global_reactive_power","Voltage",
                                                           "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                                                           skip=grep("1/2/2007", readLines("household_power_consumption.txt" )), 
                                                           nrows=2878)
                                                           
                                                           

P_data1 <- mutate(P_data1, DateTime = as.POSIXct(paste(Date, Time), format ="%d/%m/%Y %H:%M:%S"))

plot(Global_active_power ~ DateTime, data = P_data1, xlab = "", ylab = "Global Active Power (kilowatts)", 
type = "n")
                                                           
lines(Global_active_power ~ DateTime, data = P_data1)
                                                           
                                                           
dev.copy(png, "plot2.png", width=480, height=480)
                                                    
dev.off()
