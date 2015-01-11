readData <- function(){
  epc <- read.table('household_power_consumption.txt', sep=';', skip=66637, nrows=2880)
  names(epc) <- names(read.table('household_power_consumption.txt', sep=';', nrows=1, header=TRUE))
  epc$DateTime <- as.POSIXlt(paste(epc$Date, epc$Time), format = '%d/%m/%Y %H:%M:%S')
  epc
}

epc <- readData()
png(file='plot3.png', width=480, height=480)
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
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()