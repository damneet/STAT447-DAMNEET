require(rstan)
u<-ur_data$UR/100
v<-Canadian_vaccines$dose_rate/100
N<-29


fit = stan(
  seed = 123,
  file = "~/Desktop/MODEL1.stan",  
  data = list(u=u,N=N),      
  iter = 1000                   
)

fit

samples = extract(fit)$mu
n_samples = nrow(samples)


plot(1:N,samples[i,])
plot(1:N,u)

