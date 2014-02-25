
library(dplyr)

# Reading data

data <- read.table("household_power_consumption.txt", header = T, sep = ";")

df <- data %>% mutate(Date = as.Date(Date, "%d/%m/%Y"), datetime = as.POSIXct(paste(Date, Time), "%Y-%m-%d %H:%M:%S", tz = "")) %>% 
  filter(Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")) %>%
  mutate(across(Global_active_power:Sub_metering_2, as.numeric))

# Plotting Plot 2

png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(df$datetime, df$Global_active_power, type = "n", 
     ylab = "Global Active Power (kilowatts)", xlab = "")
lines(df$datetime, df$Global_active_power)

dev.off()