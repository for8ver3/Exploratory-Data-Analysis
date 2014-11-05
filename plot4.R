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

# Plot 4
png(file="plot4.png", height=480, width=480)
par(mfrow=c(2,2), mar=c(4,4,2,1))

plot(data$Global_active_power ~ data$DateTime, type="l", 
     xlab="", ylab="Global Active Power")

plot(data$Voltage ~ data$DateTime, type="l", 
     xlab="datetime", ylab="Voltage")

with(data, {
  plot(Sub_metering_1 ~ DateTime, type="l",
       ylab = "Energy sub metering", xlab = "")
  lines(Sub_metering_2 ~ DateTime, col="red")
  lines(Sub_metering_3 ~ DateTime, col="blue")
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", cex=0.6)
})

plot(data$Global_reactive_power ~ data$DateTime, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()

