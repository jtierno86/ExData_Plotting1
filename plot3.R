
unzip(zipfile = "exdata_data_household_power_consumption.zip")
data <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = T), 
        header = T, sep = ";",na.strings = "?", stringsAsFactors = F,
        col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
data$datatime <- as.POSIXct(strptime(paste(data$Date, data$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

# PLOT 3

png(filename = "plot3.png", width = 480, height = 480)
with(data, {
        plot(Sub_metering_1 ~ datatime, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
        lines(Sub_metering_2 ~ datatime, col = "red")
        lines(Sub_metering_3 ~ datatime, col = "blue")
        }
)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
