
unzip(zipfile = "exdata_data_household_power_consumption.zip")
data <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = T), 
        header = T, sep = ";",na.strings = "?", stringsAsFactors = F,
        col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data$datatime <- as.POSIXct(strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

head(data)
summary(data)
class(data$datatime)

# PLOT 2

png(filename = "plot2.png", width = 480, height = 480)
plot(data$Global_active_power ~ data$datatime, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()

