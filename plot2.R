# generate plot #2 (Weekday/Global Active Power)

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
png(filename="plot2.png", width = 480, height = 480)
plot(df$DateTime,df$Global_active_power,type='l', xlab="",ylab="Global Active Power (kilowatts)")
dev.off()