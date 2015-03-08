############################################################
# Plot4: Comparison of various features and how they
#          vary over time.
############################################################

#### Load Data ####

data = read.csv(file = "./Data/household_power_consumption.txt", sep = ";")

#### Subset Data ####
dateTest = as.Date(data$Date,"%d/%m/%Y")

idx = dateTest >= as.Date("01/02/2007","%d/%m/%Y") & dateTest <= as.Date("02/02/2007","%d/%m/%Y")

plotData = data[idx,]

#### Plot Data of interest #####

# Open graphics device
png(filename = "plot4.png", width = 480, height = 480) 

par(mfrow = c(2, 2)) # Set number of subplots

# Plot 1: Global Active Power v datetime
plot(1:2880/1440, plotData$Global_active_power, xaxt = "n",type="l", main = "", xlab = "", ylab = "Global Active Power")

axis(1, at = c(0,1,2), labels = c("Thu", "Fri", "Sat"))

# Plot 2: Voltage v datetime

plot(1:2880/1440, as.numeric(as.character(plotData$Voltage)), 
     xaxt = "n",type="l", main = "", xlab = "datetime", ylab = "Voltage")

axis(1, at = c(0,1,2), labels = c("Thu", "Fri", "Sat"))

# Plot 3: Energy sub metering v datetime
plot(1:2880/1440, plotData$Sub_metering_1, xaxt = "n", yaxt = "n",
     ylim=c(-0.3, 38),type="n", main = "", xlab = "", ylab = "Energy sub metering")
lines(1:2880/1440, as.numeric(as.character(plotData$Sub_metering_1)), col = "Black")
lines(1:2880/1440, as.numeric(as.character(plotData$Sub_metering_2)), col = "Red")
lines(1:2880/1440, as.numeric(as.character(plotData$Sub_metering_3)), col = "Blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n", lty = 1, lwd = 1, col = c("Black", "Red", "Blue"), border = "white")

axis(1, at = c(0,1,2), labels = c("Thu", "Fri", "Sat"))
axis(2, at = c(0,10,20,30), labels = c("0", "10", "20", "30"))

# Plot 4, Global_reactive_power v datetime

plot(1:2880/1440, as.numeric(as.character(plotData$Global_reactive_power)), 
     xaxt = "n",type="l", main = "", xlab = "datetime", ylab = "Global_reactive_power")

axis(1, at = c(0,1,2), labels = c("Thu", "Fri", "Sat"))

dev.off() # Close graphics device

# EOF