# Load libraries you will need:
library(tidyverse)
library(dplyr)
library(naniar)
library(chron)

# save file in working director, and read in using read.csv: 

file_raw <- "exdata_data_household_power_consumption/household_power_consumption.txt"
data_raw <- read.csv(file_raw, header = TRUE, sep = ";")

# Check dates and filter for period of interest: 

date_cleaned <- data_raw %>% replace_with_na(replace = list(Date = "?" , Global_active_power = "?"))
dates <- as.Date(date_cleaned$Date,"%d/%m/%Y")
data_clean <- subset(date_cleaned, dates >= "2007-02-01" & dates <= "2007-02-02")

data_clean$Date <- as.Date(data_clean$Date,"%d/%m/%Y")
data_clean$Time <- times(data_clean$Time)
data_clean$DateTime <- as.POSIXct(paste(data_clean$Date, data_clean$Time), format="%Y-%m-%d %H:%M:%S")
