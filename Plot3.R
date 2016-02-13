##Read the data
OrigData <- read.table("household_power_consumption.txt", head = TRUE, sep = ";")
name = colnames(OrigData)

NewData <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), 
                      col.names = name, header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')

##Convert date and time format
NewData$Date <- as.Date(NewData$Date, format = "%d/%m/%Y")

datetime <- paste(as.Date(NewData$Date), NewData$Time)
NewData$Datetime <- as.POSIXct(datetime)

##Create Plot3
win.graph(480,480)
par(oma = c(1,1,1,1))
with(NewData, {
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
    })
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.8)
