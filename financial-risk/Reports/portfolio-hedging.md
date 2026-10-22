# Portfolio Tail Risk and Hedge Sizing

Cameron Batts

Estimate five-day tail losses, market beta exposure, and an illustrative delta-based option hedge.

## Results

Five-day 99% expected shortfall is approximately $8.98 million on a $100 million illustrative position. The delta-only scenario uses 234 contracts and reduces simulated expected shortfall by 7.51%.

## Method and limits

Uses a recorded 2020–2024 adjusted-price snapshot, 100,000 matched five-day bootstrap draws and a constant option delta. Hedge premiums, gamma, volatility changes, expiry and transaction costs are excluded.

## Reproduce

Run from the collection root with the named local data file available:

```sh
Rscript R/run_analysis.R portfolio-hedging
```

[Source](../Notebooks/portfolio-hedging.qmd) · [Executed report](portfolio-hedging.html) · [Validation record](portfolio-hedging-validation.json)
