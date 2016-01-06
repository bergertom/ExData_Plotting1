# generate plot #4 (2x2 matrix showing a total of 4 plots)

# download data and extract data from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
file <- file.path(getwd(), "household_power_consumption.txt")

# load the data
pcs <- read.csv(file, sep=";")
pcs <- read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors=FALSE, na.strings="?")

# parse DateTime
pcs$DateTime <- strptime(paste(pcs$Date, pcs$Time, sep  = " "), "%d/%m/%Y %H:%M:%S")

# subset from the dates 2007-02-01 and 2007-02-02.
df <- subset(pcs, Date == "1/2/2007" | Date == "2/2/2007")

# Construct the plot and save it to a PNG file 480x480 pixels
png(filename="plot4.png", width = 480, height = 480)

# start with an empty 2x2 plot
par(mfrow = c(2,2))

# draw plot 4.1 (Global Active Power/Frequency)
plot(df$DateTime,df$Global_active_power,type='l', xlab="",ylab="Global Active Power")

# draw plot 4.2 (Weekday/Voltage)
plot(df$DateTime,df$Voltage,type='l', xlab="datetime",ylab="Voltage")

# draw plot 4.3 (Weekday / Energy sub metering 1,2,3)
# start with an empty plot
plot(df$DateTime, df$Sub_metering_1, type="n",  ylab = "Energy sub metering", xlab ="")
# on OSX topleft prodcuces a wrong result in R-Studio Viewer, but PNG is correct
legend("topright", pch="_", col = c("black", "red", "blue"), legend = c("Sub_metering 1", "Sub_metering 2", "Sub_metering 3"), bty="n")

# add the 3 plot lines
lines(y=df$Sub_metering_1, x=df$DateTime)
lines(y=df$Sub_metering_2, x=df$DateTime, col="red")
lines(y=df$Sub_metering_3, x=df$DateTime, col="blue")

# draw plot 4.4 (Weekday/Global_reactive_power)
plot(df$DateTime,df$Global_reactive_power,type='l', xlab="datetime",ylab="Global_reactive_power")

dev.off()