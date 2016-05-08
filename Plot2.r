if(is.element("Plotdata.rda", list.files())){
load(file="Plotdata.rda")} else{
  a= read.delim("household_power_consumption.txt", header = T, sep = ";",stringsAsFactors = F)
  D = as.Date(a[,1],"%d/%m/%Y")
  T = strptime(paste(a[,1],a[,2]),"%d/%m/%Y %H:%M:%S")
  b = a[,3:ncol(a)]
  for ( i in 1:ncol(b)){b[,i] = as.numeric(b[,i])}
  B = cbind(D,T,b)
  C = B[which(B$D>="2007-02-01"&B$D<="2007-02-02"),]
  remove(a,D,T,b,B)  
  write(C, file = "Plotdata.rda")
}
plot(x=C$T,y=C$Global_active_power, pch = "",ylab = "Global Active Power(Kilowatts)",xlab = "")
lines(x=C$T,y=C$Global_active_power)
dev.copy(png,'plot2.png')
dev.off()
dev.off()