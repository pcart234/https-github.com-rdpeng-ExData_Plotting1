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
                                                           
 par(mfcol = c(2, 2), mar = c(5, 5, 1, 1), oma = c(0, 0, 2, 0))                                                          
                                                           
                                                           
 #Graph11

                                                          
plot(Global_active_power ~ DateTime, data = P_data1, xlab = "", ylab = "Global Active Power (kilowatts)", 
type = "n")
                                                           
                                                        
lines(Global_active_power ~ DateTime, col= "black", data = P_data1)
                                                           
                                                           
                                                           
                                                           
                                                           
#Graph21
                                                         
plot(Sub_metering_1 ~ DateTime, data = P_data1, xlab = "", ylab = "Energy sub metering", 
type = "n")
                                                           
                                                           
                                                           
                                                           
lines(Sub_metering_1 ~ DateTime, col="black", data = P_data1, lwd=1)
                                                           
lines(Sub_metering_2 ~ DateTime, col="red", data = P_data1, lwd=1)
                                                          
lines(Sub_metering_3 ~ DateTime, col="blue", data = P_data1, lwd=1)
                                              
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), 
                                                        
    legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                                                        
    cex = 0.75, text.width = strwidth(c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))[1]/0.8)
                                                           
                                                           
                                                           
                                                           
#Graph12
                                                           
                                                            
plot(Voltage ~ DateTime, data = P_data1, xlab = "datetime", ylab = "Voltage", type = "n")
                                                          
lines(Voltage ~ DateTime, col= "black", data = P_data1)
                                                           
                                                           
                                                           
                                                           
#Graph22
                                                           
                                                      
plot(Global_reactive_power ~ DateTime, data = P_data1, xlab = "datetime", ylab = "Global_reactive_power", type = "n")
                                                           
                                                           
lines(Global_reactive_power ~ DateTime, col= "black", data = P_data1)
                                                        
                                                           
dev.copy(png, "plot4.png", width = 480, height = 480)
                                                         
dev.off()
                                                           
                                                           
                                                           

