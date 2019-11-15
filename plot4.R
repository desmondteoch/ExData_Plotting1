# convert data into table
data <- "./household_power_consumption.txt"
dt <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subdt <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"),]

# prepare data
datetime <- strptime(paste(subdt$Date, subdt$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
sub1 <- as.numeric(subdt$Sub_metering_1)
sub2 <- as.numeric(subdt$Sub_metering_2)
sub3 <- as.numeric(subdt$Sub_metering_3)
gap <- as.numeric(subdt$Global_active_power)
grp <- as.numeric(subdt$Global_reactive_power)
volt <- as.numeric(subdt$Voltage)

# plot data
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# top left
plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power", cex = 0.2)

# top right
plot(datetime, volt, type = "l", xlab = "datetime", ylab = "Voltage")

# bottom left
plot(datetime, sub1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, sub2, type = "l", col = "red")
lines(datetime, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2, col = c("black", "red", "blue"), bty = "n")

# bottom right
plot(datetime, grp, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
