# Reading the table and specifying the ';' as a separator
table <- read.table("/Users/tamadjala/Desktop/R_Coursera/plot_project/household_power_consumption.txt", 
                    header = TRUE, sep =";", na.strings = '?')

table$Date <- as.Date(table$Date, format= "%d/%m/%Y")

data <- subset(table, Date >= "2007-02-01" & Date <= "2007-02-02") 

#combine date and time
dateTime <- paste(data$Date, data$Time)

dateTime <- setNames(dateTime, "DateTime")

#Remove Date and time column 
data <- data[, !(names(data) %in% c("Date", "Time") )]
# Adding the DateTime column
data <- cbind(dateTime, data)
#DateTime column format
data$dateTime <- as.POSIXct(dateTime)

#Plotting
png(filename = "./Png_file/plot3.png", width = 480, height = 480, units = "px")

plot(data$Sub_metering_1~data$dateTime, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(data$Sub_metering_2~data$dateTime, col = "red")
lines(data$Sub_metering_3~data$dateTime, col = "blue")

legend("topright", col = c("black", "red", "blue"), 
                legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd = 1)


dev.off()




