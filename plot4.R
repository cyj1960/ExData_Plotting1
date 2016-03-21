
library(dplyr)

setwd("C:/Users/ychen.DESIGN/Downloads/exdata-data-household_power_consumption")

rawdata <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?")

data <- rawdata %>% filter(Date %in% c("1/2/2007","2/2/2007"))

DateTime <- strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

data <- cbind(DateTime, data)

par(mfrow=c(2,2))

plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")


plot(data$DateTime, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2,col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty="solid", col=c("black","red","blue"), bty="n")

plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

