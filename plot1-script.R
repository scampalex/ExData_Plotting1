
# Load libraries you will need:
library(tidyverse)
library(dplyr)
library(naniar)

# save file in working director, and read in using read.csv: 

file_raw <- "exdata_data_household_power_consumption/household_power_consumption.txt"
data_raw <- read.csv(file_raw, header = TRUE, sep = ";")

# Check dates and filter for period of interest: 

date_clean <- data_raw %>% replace_with_na(replace = list(Date = "?")) 
dates <- as.Date(date_clean$Date,"%d/%m/%Y")
data_clean <- subset(date_clean, dates >= "2007-02-01" & dates <= "2007-02-02")

data_clean2 <- data_clean %>% replace_with_na(replace = list(Global_active_power = "?"))  
data_clean2 <- as.data.frame(apply(data_clean2, 2, as.numeric))

## Create and Saving Histogram
png("plot1.png", width = 480, height = 480)
hist(data_clean2$Global_active_power, main = "Global Active Power", col = "Red", xlab = "Global Active Power (kilowatts)")
dev.off()


