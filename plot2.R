
library(dplyr)

setwd("C:/Users/ychen.DESIGN/Downloads/exdata-data-household_power_consumption")

rawdata <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?")

data <- rawdata %>% filter(Date %in% c("1/2/2007","2/2/2007"))

DateTime <- strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

data <- cbind(DateTime, data)


plot(data$DateTime, data$Global_active_power, type="l",xlab = "", ylab = "Global Active Power (kilowatts)")

dev.print(png, file="plot2.png", width=480, height=480)
