# Reading the table and specifying the ';' as a separator
table <- read.table("/Users/tamadjala/Desktop/R_Coursera/plot_project/household_power_consumption.txt", header = TRUE, sep =";", na.strings = '?')

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

# plotting
png(filename = "./Png_file/plot2.png", width = 480, height = 480, units = "px")
plot(data$Global_active_power~data$dateTime, type ="l", xlab = " " , ylab = "Global Active Power (kilowatts)")

dev.off()







    
    
    