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
