require(rstan)
library(rstan)
install.packages("rstan")
Yes
u<-ur_data$UR/100
v<-Canadian_vaccines$dose_rate/100
N<-29

fit = stan(
  seed = 123,
  file = "~/Desktop/MODEL1.stan",  # Stan program
  data = list(u=u,v=v,N=N),        # named list of data
  iter = 1000                   # number of samples to draw
)

fit

