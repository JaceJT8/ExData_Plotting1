#Read full dataset

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subset data and convert date formats

data_selected <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data_selected$Date <- as.Date(data_selected$Date, format="%d/%m/%Y")

datetime <- paste(as.Date(data_selected$Date), data_selected$Time)
data_selected$Datetime <- as.POSIXct(datetime)

# Setup graph space

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#graph1 and 2
with(data_selected, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power", xlab="")
        
        plot(Voltage~Datetime, type = "l", xlab = "datetime", ylab = "Voltage")
        
})

# Graph 3

with(data_selected, {
        plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab ="")
        lines(Sub_metering_2~Datetime, type="l", col = "red")
        lines(Sub_metering_3~Datetime, type="l", col="blue")
        legend("topright", col = c("black", "red", "blue"), lty=1, lwd=2, yjust = 1, bty="n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

#Graph 4

with(data_selected, {
        plot(Global_reactive_power~Datetime, type = "l", xlab = "datetime")
})

# Export PNG

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()