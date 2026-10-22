# Retirement Wealth Simulation

Cameron Batts

Compare five-year retirement wealth under equity-funded spending and a prefunded STRIPS strategy using matched bootstrap returns.

## Results

Median five-year equity wealth is $2,701,401, compared with $2,598,073 for the prefunded STRIPS strategy. The corresponding fifth-percentile wealth values are $1,067,599 and $1,146,281.

## Method and limits

The two spending strategies use the same 10,000 resampled return paths. Lower-tail values are terminal wealth thresholds, not conventional loss VaR. Independent annual resampling is a simplifying assumption.

## Reproduce

Run from the collection root with the named local data file available:

```sh
Rscript R/run_analysis.R retirement-wealth
```

[Source](../Notebooks/retirement-wealth.qmd) · [Executed report](retirement-wealth.html) · [Validation record](retirement-wealth-validation.json)
