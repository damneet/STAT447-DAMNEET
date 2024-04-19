suppressPackageStartupMessages(require(rstan))
suppressPackageStartupMessages(require(ggplot2))
suppressPackageStartupMessages(require(dplyr))
suppressPackageStartupMessages(require(bayesplot))

u<-ur_data$UR/10
length(u)
v<-Canadian_vaccines$dose_rate/100
N<-29
u
ur

fit = stan(
  seed = 123,
  file = "~/Documents/GitHub/STAT447-DAMNEET/MODEL1.stan",  
  data = list(u=ur,v=v,N=N,v_pred=1),      
  iter = 1000                   
)

fit


mu2_values<-extract(fit)$mu
averages <- colMeans(mu2_values)/10
averages

plot(v,averages,col="red",type="b",
      main="Bayesian Model 2",
      ylab="Unemployment Rate",
      xlab="Vaccine Rate",
     ylim=c(0.045,0.095))
lines(u/10,type="b")
legend("bottomleft", legend = c("Actual", "Model Predicted"),
       col = c("black", "red"),
       lty = c(1, 1))  # b for boxes

plot(1:N,u/10)
lines(1:N,averages,col="red",type="b")
lines(1:N,predictions,col="blue",type="b")

## Error terms with priors:

errors <- data.frame(matrix(ncol = 29, nrow = 2000))

mu2_values<-mu2_values/10

for (i in 1:29){
  error<-(mu2_values[,i])-u[i]/10
  errors[, i] <- error
}
  
errors1<-averages-u/10

plot(errors1,type="b")
sqrt(mean(errors1^2))

options(scipen=0)

slopes<-extract(fit)$slope/10
intercepts<-extract(fit)$intercept
hist(slopes,main="Histogram of Slopes")
mean(slopes)
hist(intercepts)
mean(intercepts)

inv_logit <- function(x) {
  exp_x <- exp(-x)
  return(1 / (1 + exp_x))
}

hist(inv_logit(intercepts)/10,main="Histogram of Intercepts - Model 2",
     xlab="Intercept")
mean(inv_logit(intercepts)/10)

v_pred=v
v_pred

df<-data.frame(u=u,v=v)
df
u

N_obs = nrow(df)
N_train = N_obs-1

ci_limits <- matrix(NA, nrow(df), 2)

for (i in 1:nrow(df)) {
  N_train <- nrow(df) - 1
  train_test_dta <- list(
    N = N_train,
    v = df$v[-i], 
    u = df$u[-i], 
    v_pred = df$v[i]
  )
  
  fit  = stan(
    seed = 123,
    file = "~/Documents/GitHub/STAT447-DAMNEET/MODEL1.stan",  
    data = train_test_dta,      
    iter = 1000                   
  )
  
  samples <- (rstan::extract(fit)$u_pred)
  
  obs_credible_interval <- quantile(samples, c(0.025, 0.975))
  
  ci_limits[i, ] <- obs_credible_interval
}

merged_df = df %>% 
  bind_cols(data.frame(CI_L = ci_limits[,1], CI_R = ci_limits[,2])) %>% 
  mutate(Inside_CI = (u >= CI_L & u <= CI_R)) 
merged_df %>% 
  ggplot(aes(x = 1:N_obs, y = u, ymin = CI_L, ymax = CI_R, color=Inside_CI)) +
  geom_point() + 
  geom_errorbar() +
  theme_minimal() +
  labs(x = "Point", y = "Unemployment Rate")


mcmc_trace(fit, pars = c("slope")) + theme_minimal()
mcmc_trace(fit, pars = c("intercept")) + theme_minimal()


mcmc_rank_hist(fit, pars = c("slope")) + theme_minimal()
mcmc_rank_hist(fit, pars = c("intercept")) + theme_minimal()

0.124^2

sqrt(0.00004704276)
