# Unzipping the archive
unzip("data/household_power_consumption.zip", exdir = "data");

# Reading data
providedData <- read.csv("data/household_power_consumption.txt", stringsAsFactors = F, sep = ";");
# Transforming the date in Date type
providedData$Date = as.Date(strptime(providedData$Date,format = '%d/%m/%Y'));

# Filtering the data
filteredData <- providedData[providedData$Date >= '2007-02-01' & providedData$Date <= '2007-02-02',];
# Transforming Global_active_power from char to double
filteredData$Global_active_power = as.double(filteredData$Global_active_power);

# Using the png output
png( filename = "plot1.png", width = 480, height = 480);
# Creating the histogram
hist(filteredData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "#FF2600");
# Closing the device
dev.off()