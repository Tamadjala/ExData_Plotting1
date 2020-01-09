# Reading the table and specifying the ';' as a separator
table <- read.table("/Users/tamadjala/Desktop/R_Coursera/plot_project/household_power_consumption.txt", header = TRUE, sep =";", na.strings = '?')

table$Date <- as.Date(table$Date, format= "%d/%m/%Y")

data <- subset(table, Date >= "2007-02-01" & Date <= "2007-02-02")  

#Plot 1
png(filename = "./Png_file/plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()
