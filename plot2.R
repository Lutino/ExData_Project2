## Step 1
#  Check for the existence of a data folder. If not existent, then create. 
if(!file.exist("data")){
  dir.create("data")
}

## Step 2
#  Link to the compressed data file and download in data folder
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileURL, destfile="data/SCC_PM25.zip")

## Step 3
# change working directory, Unzip file
setwd("./data")
unzip("./data/SCC_PM25.zip")
setwd("..")

## Step 4
# Load the dataset
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

## Step 5
# Get the list of years to be considered in a vector 
yearList <- c("1999","2002","2005","2008")

## Step 6
# convert the Emissions colum into a numeric value
NEI$Emissions <- as.numeric(NEI$Emissions)

## Step 7 
# create a vector of yearly emissions totals 
yearlyBaltimoreTotal = c()

## Step 8 
# For every year:
#    Subset the data
#    Sum the emissions for that year 
#    and append to yearlyBaltimoreTotal vector
for(iyear in yearList){
  yearlyBaltimoreData <- subset(NEI, year==iyear)
  sumBaltimoreEmmisions <- sum(yearlyBaltimoreData$Emissions)
  yearlyBaltimoreTotal<-c(yearlyBaltimoreTotal,sumBaltimoreEmmisions)
}

## Step 9
# Plot the data
plot(yearList,yearlyBaltimoreTotal,main="Total PM25 between 1999 and 2008 in Baltimore", xlab="Year", ylab="Total Emissions (tons)", pch=20)

## Step 10
# Fit a linear model to the data and add to plot
model <- lm(yearlyBaltimoreTotal~as.numeric(yearList))
abline(model,lwd=2)

## Step 
# Capture the plot in a png file in the data subsfolder
dev.copy(png, file="data\\plot2.png")
dev.off()
