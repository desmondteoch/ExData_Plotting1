# convert data into table
data <- "./household_power_consumption.txt"
dt <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subdt <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"),]

# plot data
datetime <- strptime(paste(subdt$Date, subdt$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
sub1 <- as.numeric(subdt$Sub_metering_1)
sub2 <- as.numeric(subdt$Sub_metering_2)
sub3 <- as.numeric(subdt$Sub_metering_3)
png("plot3.png", width = 480, height = 480)
plot(datetime, sub1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(datetime, sub2, type = "l", col = "red")
lines(datetime, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()
