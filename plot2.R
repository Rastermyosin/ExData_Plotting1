############################################################
# Plot2: Global Active Power v datetime
############################################################

#### Load Data ####

data = read.csv(file = "./Data/household_power_consumption.txt", sep = ";")

# Subset Data #
dateTest = as.Date(data$Date,"%d/%m/%Y")

idx = dateTest >= as.Date("01/02/2007","%d/%m/%Y") & dateTest <= as.Date("02/02/2007","%d/%m/%Y")

plotData = data[idx,]

# Plot Data of interest
png(filename = "plot2.png", width = 480, height = 480)
plot(1:2880/1440, as.numeric(as.character(plotData$Global_active_power)), xaxt = "n",type="l", main = "", xlab = "", ylab = "Global Active Power (kilowatts)")

axis(1, at = c(0,1,2), labels = c("Thu", "Fri", "Sat"))

dev.off()

# EOF