# This script will generate 4 plots
# https://github.com/bergertom/ExData_Plotting1

#install.packages("ggplot2")
#install.packages("pryr")
#install.packages("devtools")
#devtools::install_github("hadley/lineprof")

# download data and extract data from 
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
file <- "household_power_consumption.txt"
if (!file.exists(file)) {
    message(sprintf("starting download from '%s'", url))
    download.file(url, "exdata-data-household_power_consumption.zip")
    message(sprintf("downloaded '%s' from '%s'", file, url))
    stop("please extract the ZIP file now; then restart this script")
}

source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")

