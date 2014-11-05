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

# Plot 2
png(file="plot2.png", height=480, width=480)

plot(data$Global_active_power ~ data$DateTime, type="l", 
     ylab="Global Active Power (kilowatts)", 
     xlab="")

dev.off()
