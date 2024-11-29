# Load necessary packages
library(data.table)

# Read the data (ensure the file path is correct)
file_path <- "household_power_consumption.txt"
data <- fread(file_path, na.strings = "?", sep = ";")

# Convert Date and Time columns
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# Subset data for the dates 2007-02-01 and 2007-02-02
subset_data <- data[data$Date %in% as.Date(c("2007-02-01", "2007-02-02"))]


# plot1.R
png("plot1.png", width = 480, height = 480)
hist(subset_data$Global_active_power, col = "red", main = "Global Active Power"
     ,xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()


# plot2.R
png("plot2.png", width = 480, height = 480)
plot(subset_data$DateTime, subset_data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

# plot3.R
png("plot3.png", width = 480, height = 480)
plot(subset_data$DateTime, subset_data$Sub_metering_1, type = "l", col = "black",
     ylab = "Energy sub metering", xlab = "")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1)
dev.off()


# plot4.R
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Top-left
plot(subset_data$DateTime, subset_data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# Top-right
plot(subset_data$DateTime, subset_data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# Bottom-left
plot(subset_data$DateTime, subset_data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(subset_data$DateTime, subset_data$Sub_metering_2, col = "red")
lines(subset_data$DateTime, subset_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

# Bottom-right
plot(subset_data$DateTime, subset_data$Global_reactive_power, type = "l", ylab = "Global Reactive Power", xlab = "datetime")
dev.off()
