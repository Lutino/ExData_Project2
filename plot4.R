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
# Subset classification table to only item containing the string "coal" in their short name
coalClassification <-classification[grep("coal", classification$Short.Name, ignore.case = TRUE),]

## Step 6 
# Subset National data to only items with SCC contained in coalclassification
usCoalNEI <- subset(NEI, SCC %in% coalClassification$SCC)

## Step 7
# convert useful fields into appropriates types
usCoalNEI<- transform(usCoalNEI, Emissions=as.numeric(Emissions), year=factor(year))
# and plot
qplot(year,Emissions, data=usCoalNEI, stat="summary", fun.y = "mean")+labs(title="US Average Emissions per Year of coal related Polutant")

# ## Step8 
# # Capture the plot in a png file in the data subsfolder
dev.copy(png, file="data\\plot4.png")
dev.off()
