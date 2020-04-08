#Read full dataset

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subset data and convert date formats

data_selected <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data_selected$Date <- as.Date(data_selected$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data_selected$Date), data_selected$Time)
data_selected$Datetime <- as.POSIXct(datetime)

#PLot line graph 

with(data_selected, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
})

#Export PNG

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()