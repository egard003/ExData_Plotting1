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

plot(sub$dateTime, sub$Global_active_power, ylab = "Global Active Power (killowatts)", xlab = "", type="l")