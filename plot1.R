readData <- function(){
  epc <- read.table('household_power_consumption.txt', sep=';', skip=66637, nrows=2880)
  names(epc) <- names(read.table('household_power_consumption.txt', sep=';', nrows=1, header=TRUE))
  epc$DateTime <- as.POSIXlt(paste(epc$Date, epc$Time), format = '%d/%m/%Y %H:%M:%S')
  epc
}

epc <- readData()
png(file='plot1.png', width=480, height=480)
hist(epc$Global_active_power,
     xlab = 'Global Active Power (kilowatts)',
     main = 'Global Active Power',
     col = 'red'
     )
dev.off()