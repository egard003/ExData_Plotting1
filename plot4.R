file <- read.csv("hpc.csv", sep = ";")

file$Date <- as.Date(file$Date, "%d/%m/%Y")
sub <- file[file$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]

sub$Time <- strptime(sub$Time, "%H:%M:%S")
sub$Time <- format(sub$Time, "%H:%M:%S")


sub$Global_active_power <- as.numeric(as.character(sub$Global_active_power))
sub$Global_reactive_power <- as.numeric(as.character(sub$Global_reactive_power))
sub$Voltage <- as.numeric(as.character(sub$Voltage))
sub$Sub_metering_1 <- as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2 <- as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3 <- as.numeric(as.character(sub$Sub_metering_3))

sub$dateTime <- with(sub, as.POSIXct(paste(sub$Date, sub$Time), format = "%Y-%m-%d %H:%M:%S"))

par(mfcol = c(2,2))

plot(sub$dateTime, sub$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type="l")

plot(sub$dateTime, sub$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type="l")
lines(sub$dateTime, sub$Sub_metering_2, col="red")
lines(sub$dateTime, sub$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"))

plot(sub$dateTime, sub$Voltage, ylab = "Voltage", xlab = "datetime", type="l")

plot(sub$dateTime, sub$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type="l")
