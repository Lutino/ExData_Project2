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
# Subset classification table to only item containing the string "Highway Veh" in their short name
vehicleClassification <-classification[grep("Highway Veh", classification$Short.Name, ignore.case = TRUE),]

## Step 6 
# Subset NEI to the Baltimore data and Motor vehicle pollution
BaltimoreVehiclesNEI<- subset(NEI, fips == "24510" & (SCC %in% vehicleClassification$SCC))

## Step 7
# convert useful fields into appropriates types
BaltimoreVehiclesNEI<- transform(BaltimoreVehiclesNEI, Emissions=as.numeric(Emissions), year=factor(year))
# and plot
qplot(year,Emissions, data=BaltimoreVehiclesNEI, stat="summary", fun.y = "mean")+labs(title="Baltimore Total Emmissions per Year per Type of Polutant")

# ## Step 8 
# # Capture the plot in a png file in the data subsfolder
dev.copy(png, file="data\\plot5.png")
dev.off()
