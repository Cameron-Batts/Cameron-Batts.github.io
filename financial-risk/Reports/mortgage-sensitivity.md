# Mortgage Default and Loan-to-Value Sensitivity

Cameron Batts

Join loan origination and performance histories, fit a default hazard model, and compare a higher loan-to-value scenario.

## Results

The hypothetical default probability changes from 3.50% to 4.57% over 61 months when loan-to-value rises by 10 points. The fitted hazard ratio is 1.3127.

## Method and limits

The scenario raises original loan-to-value by 10 percentage points with other covariates fixed. This is an in-sample association, not a causal effect. Prepayment is treated as censoring. The workflow estimates default probabilities; it does not complete an amortizing expected-dollar-loss model.

## Reproduce

Run from the collection root with the named local data file available:

```sh
Rscript R/run_analysis.R mortgage-sensitivity
```

[Source](../Notebooks/mortgage-sensitivity.qmd) · [Executed report](mortgage-sensitivity.html) · [Validation record](mortgage-sensitivity-validation.json)
