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

<img width="516" alt="Screen Shot 2024-04-09 at 2 18 23 PM" src="https://github.com/damneet/STAT447-DAMNEET/assets/122494296/4c56ed5e-5f54-473c-8626-91623c0a1bf0">

- Problem: plot is wrong, ranging from 0 to 0.5. In order to combat this, we add mu and scale the unemployment rates by 10.
- 
<img width="540" alt="Screen Shot 2024-04-11 at 4 45 50 PM" src="https://github.com/damneet/STAT447-DAMNEET/assets/122494296/928c1e24-9fcb-4ca9-9e43-a7679091059e">


