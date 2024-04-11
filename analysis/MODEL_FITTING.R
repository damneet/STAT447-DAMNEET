suppressPackageStartupMessages(require(rstan))
suppressPackageStartupMessages(require(ggplot2))
suppressPackageStartupMessages(require(dplyr))
u<-ur_data$UR/100
v<-Canadian_vaccines$dose_rate/100
N<-29


fit = stan(
  seed = 123,
  file = "~/Desktop/MODEL1.stan",  
  data = list(u=u,v=v,N=N,v_pred=0.2),      
  iter = 1000                   
)

fit

samples = extract(fit)$mu2
n_samples = nrow(samples)

plot(v,u,ylim=c(0.04,0.1))
lines(v,mu2_vector,col="red")
mu2_vector <- c(0.09, 0.10, 0.09, 0.07, 0.08, 0.08, 0.08, 0.07, 0.07, 0.07,
                0.06, 0.06, 0.06, 0.07, 0.06, 0.05, 0.05, 0.06, 0.05, 0.05,
                0.05, 0.05, 0.06, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05)

slopes<-extract(fit)$slope
intercepts<-extract(fit)$intercept
hist(slopes)
hist(intercepts)
mean(intercepts)