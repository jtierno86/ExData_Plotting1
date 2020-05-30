
unzip(zipfile = "exdata_data_household_power_consumption.zip")
data <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = T), 
        header = T, sep = ";",na.strings = "?", stringsAsFactors = F,
        col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data$datatime <- as.POSIXct(strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))


# PLOT 4

png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
        plot(Global_active_power ~ datatime, type = "l", xlab = "", ylab = "Global Active Power")
        plot(Voltage ~ datatime, type = "l", xlab = "datetime",  ylab = "Voltage")
        plot(Sub_metering_1 ~ datatime, type = "l",  xlab = "", ylab = "Energy sub metering")
        lines(Sub_metering_2 ~ datatime, col = 'Red')
        lines(Sub_metering_3 ~ datatime, col = 'Blue')
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n")
        plot(Global_reactive_power ~ datatime, type = "l",  xlab = "datetime", ylab = "Global_rective_power")
        }
)
dev.off()
