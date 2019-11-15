# convert data into table
data <- "./household_power_consumption.txt"
dt <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subdt <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"),]

# plot data
datetime <- strptime(paste(subdt$Date, subdt$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(subdt$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(datetime, gap, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
