# Project 2 - Exploratory Data Analysis

## Introduction
The overall goal of this page is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. It presents answers and justifications to the following questions:

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008?
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

## Trend of total emissions of PM2.5 in the US 1999-2008
The <b>negative slope</b> of the regression line in below shows that total emissions from PM2.5 decreased in the United States between 1999 and 2008.
### Plot 1
![Plot of Total PM25 Emissions 1999-2008](data/plot1.png)

## Trend of total emissions of PM2.5 in Baltimore City between 1999-2008
again, by regressing the annual volumes of PM2.5, the slope appears to be negative, indicating an overall decline of total emissions from PM2.5
### Plot 2
![Plot of Total PM25 Emissions in Baltimore City : 1999-2008](data/plot2.png)

## Trend of each type of PM2.5 Polutant in baltimore city between 1999-2008 
There have been a decrease of volume of all types of pollutant (point, nonpoint, onroad, nonroad) over the city of Baltimore over this period.
### Plot 3
![Plot of Total PM25 Emissions in Baltimore City / Type: 1999-2008](data/plot3.png)

## Trend of coal related PM2.5 Polutant in the US between 1999-2008 
The plot below shows an overall decline in the volume of coal related pollution in the US between 1999 and 2008.
### Plot 4
![Plot of Average Coal related polutants in the US : 1999-2008](data/plot4.png)

## Trend of motor vehicle pollution in Baltimore City between 1999-2008 
The plot shows a decline of motor vehicle pollution in Baltimore City between 1999 and 2008.
### Plot 5
![Plot of Average motor vehicle pollution Baltimore City: 1999-2008](data/plot5.png)

## Comparative Trend of motor vehicle pollution in Baltimore City and Los angeles between 1999-2008 
As plot 5 below shows, While motor vehicle pollution in Baltimore City stayed almost constant, Los angeles County had a considerable increase between 1999 and 2008.
### Plot 6
![Plot of Average motor vehicle pollution in Baltimore City and Los Angeles County: 1999-2008](data/plot6.png)
