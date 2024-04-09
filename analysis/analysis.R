vaccine_rates<-data_example2
vaccine_rates$numtotal_atleast1dose
vaccine_rates<-data.frame(vaccine_rates)
vaccine_rates

Canadian_vaccines<-subset(vaccine_rates, prename == "Canada")


Canadian_vaccines$week_end

ur_data<-read.csv("~/Desktop/STAT 447C/PROJECT DATA/UR_DATA.csv")
ur_data<-ur_data[-c(40,41),]
ur_data<-data.frame(ur_data)
ur_data

Canadian_vaccines<-data.frame(
  date=Canadian_vaccines$week_end,
  dose_rate=Canadian_vaccines$proptotal_atleast1dose)
Canadian_vaccines

Canadian_vaccines<-Canadian_vaccines[-c(1,3:6,8:10,12:14,16:18,20:23,
                                        25:27,29:32,34:36,38:40,42:45,47:49,51:53,55:58,60:62,64:66,68:69,71,80,85:88),]
plot(1:length(Canadian_vaccines$dose_rate),Canadian_vaccines$dose_rate)
Canadian_vaccines
ur_data<-ur_data[-c(30:39),]
length(ur_data$UR)
length(Canadian_vaccines$dose_rate)
plot(Canadian_vaccines$dose_rate,ur_data$UR)


plot(1:length(ur_data$Date),ur_data$UR)
plot(1:length(Canadian_vaccines$date),Canadian_vaccines$dose_rate)


x=0:10
plot(x,log(x))
plot(x,-log(x))

plot(log(x),exp(-x))


y<-rexp(200)
plot(1:length(y),y,col="red")
mean(y)
plot.new(



