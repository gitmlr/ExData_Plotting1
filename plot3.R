
library(dplyr)

# Reading data

data <- read.table("household_power_consumption.txt", header = T, sep = ";")

df <- data %>% mutate(Date = as.Date(Date, "%d/%m/%Y"), datetime = as.POSIXct(paste(Date, Time), "%Y-%m-%d %H:%M:%S", tz = "")) %>% 
  filter(Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02")) %>%
  mutate(across(Global_active_power:Sub_metering_2, as.numeric))

# Plotting Plot 3

png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(df$datetime, df$Sub_metering_1, type = "n", 
     ylab = "Energy sub metering", xlab = "")
lines(df$datetime, df$Sub_metering_1, col = "black")
lines(df$datetime, df$Sub_metering_2, col = "red")
lines(df$datetime, df$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = names(df[7:9]))


dev.off()