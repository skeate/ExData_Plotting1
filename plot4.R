readData <- function(){
  epc <- read.table('household_power_consumption.txt', sep=';', skip=66637, nrows=2880)
  names(epc) <- names(read.table('household_power_consumption.txt', sep=';', nrows=1, header=TRUE))
  epc$DateTime <- as.POSIXlt(paste(epc$Date, epc$Time), format = '%d/%m/%Y %H:%M:%S')
  epc
}

epc <- readData()
png(file='plot4.png', width=480, height=480)
par(mfrow = c(2,2))
plot(x = epc$DateTime,
     y = epc$Global_active_power,
     ylab = 'Global Active Power',
     xlab = '',
     type = 'l'
     )
plot(x = epc$DateTime,
     y = epc$Voltage,
     xlab = 'datetime',
     ylab = 'Voltage',
     type = 'l'
     )
plot(x = epc$DateTime,
     y = epc$Sub_metering_1,
     ylab = 'Energy sub metering',
     xlab = '',
     type = 'l'
     )
lines(x = epc$DateTime,
     y = epc$Sub_metering_2,
     col = 'red')
lines(x = epc$DateTime,
     y = epc$Sub_metering_3,
     col = 'blue')
legend("topright",
       col = c('black', 'red', 'blue'),
       lwd = 1,
       lty = 1,
       bty = 'n',
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
plot(x = epc$DateTime,
     y = epc$Global_reactive_power,
     xlab = 'datetime',
     ylab = 'Global_reactive_power',
     type = 'l'
     )
dev.off()
par(mfrow = c(1,1))