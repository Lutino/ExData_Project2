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
yearlyTotal = c()

## Step 8 
# For every year:
#    Subset the data
#    Sum the emissions for that year 
#    and append to yearlyTotal vector
for(iyear in yearList){
  yearlyData <- subset(NEI, year==iyear)
  sumEmmisions <- sum(yearlyData$Emissions)
  yearlyTotal<-c(yearlyTotal,sumEmmisions)
}

## Step 9
# Plot the data
plot(yearList,yearlyTotal,main="Total PM25 between 1999 and 2008", xlab="Year", ylab="Total Emissions", pch=20)

## Step 10
# Fit a linear model to the data and add to plot
model <- lm(yearlyTotal~as.numeric(yearList))
abline(model,lwd=2)

## Step 
# Capture the plot in a png file in the data subsfolder
dev.copy(png, file="data\\plot1.png")
dev.off()