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

##Creat Plot2
win.graph(480,480)
par(oma = c(1,1,1,1))

plot(NewData$Global_active_power ~ NewData$Datetime, type = "l",ylab = "Global Active Power (kilowatts)", xlab = "")