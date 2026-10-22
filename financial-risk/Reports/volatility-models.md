# Portfolio Volatility and Risk Model Comparison

Cameron Batts

Compare Gaussian GARCH specifications, one-day VaR exceedances, and approximate capital reserves across forecast horizons.

## Results

GJR-GARCH has the lowest training-sample AIC among the three specifications. All three recorded zero 95% one-day VaR exceedances during the 30-day test window, which is too short to establish reliable tail-risk performance.

## Method and limits

Uses a 2020–2024 training sample and the first 30 trading days of 2025 as a short test window. Multi-day reserves approximate risk by summing forecast variances. This is not an exact multi-day GARCH loss distribution, and VaR exceedances alone do not validate expected shortfall.

## Reproduce

Run from the collection root with the named local data file available:

```sh
Rscript R/run_analysis.R volatility-models
```

[Source](../Notebooks/volatility-models.qmd) · [Executed report](volatility-models.html) · [Validation record](volatility-models-validation.json)
