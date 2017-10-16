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

# Transforming Global_active_power from char to double
filteredData$Global_active_power = as.double(filteredData$Global_active_power);

# Using the png output
png( filename = "plot2.png", width = 480, height = 480);
# Creating an empty plot
plot ( filteredData$DateTime, filteredData$Global_active_power, type="n", xlab = "", ylab = "Global Active Power (kilowatts)");
# Drawing the lines
lines( filteredData$DateTime, filteredData$Global_active_power );
# Closing the device
dev.off()