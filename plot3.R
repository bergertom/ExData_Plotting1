# generate plot #3 (Weekday / Energy sub metering)

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
png(filename="plot3.png", width = 480, height = 480)

# create the empty plot
plot(df$DateTime, df$Sub_metering_1, type="n",  ylab = "Energy sub metering", xlab ="")

# add the legend
legend("topright", pch="_", col = c("black", "red", "blue"), legend = c("Sub_metering 1", "Sub_metering 2", "Sub_metering 3"))

# plot the data lines
lines(y=df$Sub_metering_1, x=df$DateTime)
lines(y=df$Sub_metering_2, x=df$DateTime, col="red")
lines(y=df$Sub_metering_3, x=df$DateTime, col="blue")

dev.off()