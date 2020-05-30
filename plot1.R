
unzip(zipfile = "exdata_data_household_power_consumption.zip")
data <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = T), 
        header = T, sep = ";",na.strings = "?", stringsAsFactors = F,
        col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
head(data)
summary(data)


# PLOT 1

png(filename="plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Avtive Power", xlab = "Global Avitbe Power (kilowatts)",
        ylab = "Frequency")
dev.off()




