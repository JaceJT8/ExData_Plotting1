#Read full dataset

data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subset data and convert date formats

data_selected <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))
data_selected$Date <- as.Date(data_selected$Date, format="%d/%m/%Y")

# Plot Histogram

hist(data_selected$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

# Export PNG

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
