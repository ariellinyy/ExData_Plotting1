##Read the data
OrigData <- read.table("household_power_consumption.txt", head = TRUE, sep = ";")
name = colnames(OrigData)

NewData <- read.table(text = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"), value = TRUE), 
                      col.names = name, header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')

##Create Plot1
win.graph(480,480)
par(oma = c(1,1,1,1))
hist(NewData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")