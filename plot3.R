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
                                                           
plot(Sub_metering_1 ~ DateTime, data = P_data1, xlab = "", ylab = "Energy sub metering", 
type = "n")
                                                           
                                                           
                                                   
                                                           
lines(Sub_metering_1 ~ DateTime, col="black", data = P_data1, lwd=2)
                                                           
lines(Sub_metering_2 ~ DateTime, col="red", data = P_data1, lwd=2)
                                                           
lines(Sub_metering_3 ~ DateTime, col="blue", data = P_data1, lwd=2)
                                                           
                                                           
                                                           
                                                           
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), 
                                                           
      legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                                                           
      cex = 0.75, text.width = strwidth(c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))[1]/0.8)
                                                           
                                                           
                                                           
                                                           
dev.copy(png, "plot3.png", width=480, height=480)
                                                           
                                                           
dev.off()
