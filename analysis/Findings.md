## Findings
- Use Beta likelihood on unemployment:
- Beta($\mu$ , $\sigma$)
- Where $\mu$ = logistic($U_i$ $\theta_1$ + $\theta_2$)

### Results
- Model 1:
    - Unemployment ~ Beta($\mu$ , $\sigma$)
    - $\mu$ ~ logistic($\theta_{slope}$ $V_i$ + $\theta_{intercept}$)
    - $\theta_{slope}$ ~ Normal(0,1)
    - $\theta_{intercept}$ ~ Exp(0.1)
    - $\sigma$ ~ Exp(0.1)

   mean se_mean   sd  2.5%   25%   50%   75% 97.5% n_eff Rhat
slope     -2.47    0.01 0.32 -3.08 -2.69 -2.48 -2.25 -1.85   715 1.01
intercept  0.06    0.00 0.07  0.00  0.02  0.04  0.09  0.24  1320 1.00
sigma      5.49    0.06 1.72  2.75  4.23  5.30  6.51  9.36   896 1.00
lp__      23.67    0.05 1.31 20.40 23.09 23.99 24.63 25.23   771 1.00
