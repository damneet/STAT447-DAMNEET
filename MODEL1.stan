data {
  int<lower=0> N; 
  vector<lower=0,upper=1>[N] v;
  vector<lower=0, upper=1>[N] u; 
  real<lower=0,upper=1> v_pred;
}


parameters {
  real slope;
  real<lower=0> intercept;
  real<lower=0> sigma;
}

transformed parameters {
  vector[N] mu=inv_logit(intercept + slope*v);
}



model {
  slope ~ normal(0,10);
  intercept ~ exponential(0.01);
  sigma ~ exponential(0.01);
  u~beta_proportion(mu, sigma);
  
}

generated quantities {
  real u_pred = beta_proportion_rng(inv_logit(intercept + slope*v_pred),sigma);
}

