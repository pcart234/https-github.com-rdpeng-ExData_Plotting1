library(dplyr)
library(sqldf)
library(lubridate)
P_data1 <- read.table("household_power_consumption.txt",header = TRUE
                    ,stringsAsFactors = FALSE, sep = ";", col.names = c("Date","Time" 
                    ,"Global_active_power","Global_reactive_power","Voltage",
                    "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
                     skip=grep("1/2/2007", readLines("household_power_consumption.txt" )), 
                     nrows=2878)
                                                           
head(P_data1)
                                                       
View(P_data1)
                                                           
hist(P_data1$Global_active_power, col = "red",
xlab = "Global Active Power (kilowatts)", main = "Global Active Power")


rug(P_data1$Global_active_power)
abline(v= median(P_data1$Global_active_power), col="yellow", lwd=4)

dev.copy(png, "plot1.png", width=480, height=480)
dev.off()
