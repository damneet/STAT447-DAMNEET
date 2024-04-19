install.packages("betareg")
library(betareg)
install.packages("stargazer")
library(stargazer)
require(broom) # for tidy()
require(knitr) # for kable()
vaccine_rates<-data_example2
vaccine_rates$numtotal_atleast1dose
vaccine_rates<-data.frame(vaccine_rates)
vaccine_rates

Canadian_vaccines<-subset(vaccine_rates, prename == "Canada")
Canadian_vaccines


Canadian_vaccines$week_end

ur_data<-read.csv("~/Desktop/STAT 447C/PROJECT DATA/UR_DATA.csv")
ur_data
hist(ur_data$UR)
ur_data<-ur_data[-c(40,41),]
ur_data<-data.frame(ur_data)
ur_data

Canadian_vaccines<-data.frame(
  date=Canadian_vaccines$week_end,
  dose_rate=Canadian_vaccines$proptotal_atleast1dose)
Canadian_vaccines
hist(Canadian_vaccines$dose_rate)

Canadian_vaccines<-Canadian_vaccines[-c(1,3:6,8:10,12:14,16:18,20:23,
                                        25:27,29:32,34:36,38:40,42:45,47:49,51:53,55:58,60:62,64:66,68:69,71,80,85:88),]
Canadian_vaccines
plot(1:length(Canadian_vaccines$dose_rate),Canadian_vaccines$dose_rate)
Canadian_vaccines
ur_data<-ur_data[-c(30:39),]
length(ur_data$UR)
length(Canadian_vaccines$dose_rate)
plot(Canadian_vaccines$dose_rate/100,ur_data$UR/100,
     main="Vaccination and Unemployment Rates in Canada, 2020 to 2023",
     ylab="Unemployment Rate",
     xlab="Vaccination Rate",
     ylim=c(0.045,0.1))
lines(v,exp(predictions),type="p",col="red")
legend("bottomleft", legend = c("Actual", "Fitted"), col = c("black", "red"), pch = c(1, 1))

Vaccine<-Canadian_vaccines$dose_rate/100
Unemp<-ur_data$UR/100

ordinary_model<-lm(log(Unemp)~Vaccine)
summary(ordinary_model)

dosage<-Canadian_vaccines$dose_rate/100
dosage<-data.frame(dosage)

predictions<-predict(ordinary_model,newdata=dosage)


plot(dosage$dosage,exp(predictions))
errors_regular<-exp(predictions)-Unemp
mean(errors_regular^2)

plot(1:length(ur_data$Date),ur_data$UR)
plot(1:length(Canadian_vaccines$date),Canadian_vaccines$dose_rate)


x=0:10
plot(x,log(x))
plot(x,-log(x))

plot(log(x),exp(-x))


y<-rexp(200,rate=0.1)
hist(y)

hist(ur_data$UR)
hist(Canadian_vaccines$dose_rate)

ordinary_model<-lm(log(ur_data$UR/100) ~ Canadian_vaccines$dose_rate)
summary(ordinary_model)
new_data<-data.frame(v)

predictions<-predict(ordinary_model,newdata=new_data)

plot(v,exp(predictions))

u<-u/10
u

v<-v[-23]

betamodel <- betareg(u~ v)
summary(betamodel)

predictions1<-predict(betamodel,newdata=new_data)
predictions
plot(v,u/10)
lines(v,predictions1/10,type='p',col="blue")
lines(v,exp(predictions),type="p",col="red")

plot(1:29,u/10)
lines(predictions1/10)
lines(exp(predictions),col="red")

new<-predict(betamodel,newdata=data.frame(v=1))
new

u<-u[-23]
plot(1:(N-1),u/10)


out <- tidy(ordinary_model)
out
kable(out)


stargazer(ordinary_model, title = "Unemployment and Vaccine Rates - OLS Model", style = "default",
          out = "OLS.txt", type = "text")
