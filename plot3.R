library(ggplot2)
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
# Subset NEI to the Baltimore data
BaltimoreNEI<- subset(NEI, fips == "24510")

## Step 6
# convert useful fields into appropriates types
BaltimoreNEI<- transform(BaltimoreNEI, Emissions=as.numeric(Emissions), year=factor(year), type=factor(type))
# and plot Baltimore Emissions by source
qplot(year,Emissions, data=BaltimoreNEI, facets=.~type, stat="summary", fun.y = "mean")+labs(title="Baltimore Total Emmissions per Year per Type of Polutant")

# ## Step7 
# # Capture the plot in a png file in the data subsfolder
dev.copy(png, file="data\\plot3.png")
dev.off()
