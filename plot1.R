############################################################
# Plot1: Histrogram of Global Active Power
############################################################

#### Load Data ####

data = read.csv(file = "./Data/household_power_consumption.txt", sep = ";")

# Subset Data #
dateTest = as.Date(data$Date,"%d/%m/%Y")

idx = dateTest >= as.Date("01/02/2007","%d/%m/%Y") & dateTest <= as.Date("02/02/2007","%d/%m/%Y")

plotData = data[idx,]

# Plot Data of interest

png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(plotData$Global_active_power)), breaks = 12, col = "Red", 
     main = "Global Active power", xlab = "Global Active Power (kilowatts)")
dev.off()

# EOF