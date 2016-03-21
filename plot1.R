
library(dplyr)

setwd("C:/Users/ychen.DESIGN/Downloads/exdata-data-household_power_consumption")

rawdata <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?")

data <- rawdata %>% filter(Date %in% c("1/2/2007","2/2/2007"))

DateTime <- strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

data <- cbind(DateTime, data)

hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")


