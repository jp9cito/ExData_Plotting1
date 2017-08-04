library(dplyr)
hpc <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";",na.strings = "?")
hpc_df <- tbl_df(hpc)
h <- filter(hpc_df, Date == "1/2/2007"| Date == "2/2/2007")
h <- mutate(h, datetime = paste(Date,Time,sep=" "))
h <- mutate(h, datetime = as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S")))

png("plot1.png")
histinfo <- hist(h$Global_active_power, 
     main="Global Active Power", 
     col="red", 
     xlab = "Global Active Power(kilowatts)", 
     xaxt='n', 
     yaxt = 'n')

axis(side=1, at=seq(0,6,2))
axis(side=2, at=seq(0,1200,200))
dev.off()


