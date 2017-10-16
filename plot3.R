# Unzipping the archive
unzip("data/household_power_consumption.zip", exdir = "data");

# Reading data
providedData <- read.csv("data/household_power_consumption.txt", stringsAsFactors = F, sep = ";");
# Transforming the date in Date type
providedData$Date = as.Date(strptime(providedData$Date,format = '%d/%m/%Y'));

# Filtering the data
filteredData <- providedData[providedData$Date >= '2007-02-01' & providedData$Date <= '2007-02-02',];

# Creating DateTime column
filteredData$DateTime = do.call(paste, c(filteredData[c("Date", "Time")], sep=" "));
# Transforming into DateTime type
filteredData$DateTime = strptime(filteredData$DateTime,format = '%Y-%m-%d %H:%M:%S');

# Transforming Submeterings from char to double
filteredData$Sub_metering_1 = as.double(filteredData$Sub_metering_1);
filteredData$Sub_metering_2 = as.double(filteredData$Sub_metering_2);
filteredData$Sub_metering_3 = as.double(filteredData$Sub_metering_3);


# Using the png output
png( filename = "plot3.png", width = 480, height = 480);

# Creating an empty plot
plot ( filteredData$DateTime, filteredData$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering");
# Drawing the lines
par(col = "black");
lines( filteredData$DateTime, filteredData$Sub_metering_1);
# Changing the line color
par(col = "red");
lines( filteredData$DateTime, filteredData$Sub_metering_2);

# Changing the line color
par(col = "blue");
lines( filteredData$DateTime, filteredData$Sub_metering_3);

# Adding a legend
par(col = "black");
legend (x="topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
        col=c("black","red","blue"), pch=c(".",".","."), cex=1, lwd=2);


# Closing the device
dev.off()