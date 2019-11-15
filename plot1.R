# convert data into table
data <- "./household_power_consumption.txt"
dt <- read.table(data, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
subdt <- dt[dt$Date %in% c("1/2/2007", "2/2/2007"),]

# plot data
gap <- as.numeric(subdt$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(gap, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
