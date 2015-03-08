############################################################
# Plot3: Energy sub metering v datetime
############################################################

#### Load Data ####

data = read.csv(file = "./Data/household_power_consumption.txt", sep = ";")

# Subset Data #
dateTest = as.Date(data$Date,"%d/%m/%Y")

idx = dateTest >= as.Date("01/02/2007","%d/%m/%Y") & dateTest <= as.Date("02/02/2007","%d/%m/%Y")

plotData = data[idx,]

# Plot Data of interest
png(filename = "plot3.png", width = 480, height = 480)
plot(1:2880/1440, plotData$Sub_metering_1, xaxt = "n", yaxt = "n",
     ylim=c(-0.3, 38),type="n", main = "", xlab = "", ylab = "Energy sub metering")
lines(1:2880/1440, as.numeric(as.character(plotData$Sub_metering_1)), col = "Black")
lines(1:2880/1440, as.numeric(as.character(plotData$Sub_metering_2)), col = "Red")
lines(1:2880/1440, as.numeric(as.character(plotData$Sub_metering_3)), col = "Blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 1, col = c("Black", "Red", "Blue"))

axis(1, at = c(0,1,2), labels = c("Thu", "Fri", "Sat"))
axis(2, at = c(0,10,20,30), labels = c("0", "10", "20", "30"))

dev.off()

# EOF