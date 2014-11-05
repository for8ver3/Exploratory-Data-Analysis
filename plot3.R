# Read the full dataset
data_full <- read.csv("~/Documents/Data Science/Exploratory Data Analysis/household_power_consumption.txt", 
                      sep=";", na.strings="?")
# Convert the date 
data_full$Date <- strptime(data_full$Date, "%d/%m/%Y")

# Subset the data
data <- subset(data_full, Date=="2007-02-01" | Date=="2007-02-02")
rm(data_full)

# Conver the time and daate
datetime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(datetime)

# Plot 3
png(file="plot3.png", height=480, width=480)

with(data, {
  plot(Sub_metering_1 ~ DateTime, type="l",
       ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ DateTime, col="red")
  lines(Sub_metering_3 ~ DateTime, col="blue")
})
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
        col=c("black", "red", "blue"), lty=1, lwd=2)

dev.off()
