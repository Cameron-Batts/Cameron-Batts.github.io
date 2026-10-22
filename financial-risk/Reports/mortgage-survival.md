# Mortgage Default Survival Analysis

Cameron Batts

Compare Cox proportional hazards specifications and estimate a hypothetical loan survival curve over 120 months.

## Results

The model comparison covers 304,709 loans. The hypothetical loan has estimated survival of 95.26% through month 120 and a 0.0619% probability of default during month 120 under the model.

## Method and limits

Specifications use identical complete observations for AIC comparison. Adjacent equal-predictor intervals are combined while retaining every time gap, predictor change and event boundary; a 1,000-loan comparison verifies the same coefficients and partial likelihood as the monthly representation. Prepayment is treated as censoring. Default-only survival is not a competing-risk cumulative incidence estimate. No held-out calibration or proportional-hazards diagnostics are claimed.

## Reproduce

Run from the collection root with the named local data file available:

```sh
Rscript R/run_analysis.R mortgage-survival
```

[Source](../Notebooks/mortgage-survival.qmd) · [Executed report](mortgage-survival.html) · [Validation record](mortgage-survival-validation.json)
