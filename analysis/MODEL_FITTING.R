suppressPackageStartupMessages(require(rstan))
suppressPackageStartupMessages(require(ggplot2))
suppressPackageStartupMessages(require(dplyr))
u<-ur_data$UR/10
v<-Canadian_vaccines$dose_rate/100
N<-29
u

fit = stan(
  seed = 123,
  file = "~/Documents/GitHub/STAT447-DAMNEET/MODEL1.stan",  
  data = list(u=u,v=v,N=N,v_pred=0.4),      
  iter = 1000                   
)

fit



mu2_values<-extract(fit)$mu
averages <- colMeans(mu2_values)/10
averages

plot(v,u/10)
lines(v,averages,col="red",type="l")
plot(1:N,u/10)
lines(1:N,averages,col="red",type="l")

slopes<-extract(fit)$slope
intercepts<-extract(fit)$intercept
hist(slopes)
hist(intercepts)
mean(intercepts)

inv_logit <- function(x) {
  exp_x <- exp(-x)
  return(1 / (1 + exp_x))
}

hist(inv_logit(intercepts)/10)

