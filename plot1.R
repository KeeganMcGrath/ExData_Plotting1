Data<-read.table("household_power_consumption.txt",sep = ";",skip=66637,nrows = 2880,stringsAsFactors = FALSE)
colnames(Data)<-c("Date","Time","Global_active_power","Global_reactive_power",
      "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

##Creating the plot
Global_Active_Power<-NULL
for(i in 1:nrow(Partial)) {
      Global_Active_Power[i]<-Data[i,3]
}
par(mar=c(4,4,2,2))
hist(Global_Active_Power,xlab="Global Active Power (kilowatts)",col="Red",main="Global Active Power",breaks=12)
