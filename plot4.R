library(dplyr)
hpc <- read.table("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";",na.strings = "?")
hpc_df <- tbl_df(hpc)
h <- filter(hpc_df, Date == "1/2/2007"| Date == "2/2/2007")
h <- mutate(h, datetime = paste(Date,Time,sep=" "))
h <- mutate(h, datetime = as.POSIXct(strptime(datetime, "%d/%m/%Y %H:%M:%S")))

png("plot4.png")
par(mfcol =c(2,2))

#First plot
with(h,plot(datetime, Global_active_power,type="l", ylab = "Global Active Power", xlab=""))


#Second plot in the column
with(h,plot(datetime, Sub_metering_1,
            type="n", ylab = "Energy sub metering", xlab = ""))


with(h,lines(datetime, Sub_metering_1, col = "black"))

with(h,lines(datetime, Sub_metering_2, col = "red"))

with(h,lines(datetime, Sub_metering_3, col = "blue"))

legend("topright", pch="_____", col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#Third plot ( 2nd  column 1st row)
with(h,plot(datetime, Voltage, type = "l", ylab = "Voltage"))

#Fourth Plot
with(h,plot(datetime, Global_reactive_power, type = "l", ylab = "Global_reactive_power"))



dev.off()


