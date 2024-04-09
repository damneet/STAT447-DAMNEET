data {
  int<lower=0> N; 
  vector[N] v; 
  vector[N] u; 
}


parameters {
  real slope;
  real<lower=0> intercept;
  real<lower=0> sigma;
}

transformed parameters {
  vector[N] mu = inv_logit(intercept + slope*v);
}


model {
  slope ~ normal(0,1);
  intercept ~ exponential(0.1);
  sigma ~ exponential(0.1);
  u ~ beta_proportion(mu,sigma);
}

