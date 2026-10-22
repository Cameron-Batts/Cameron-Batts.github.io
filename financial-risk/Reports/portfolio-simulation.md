# Portfolio Return and Tail Risk Simulation

Cameron Batts

Compare empirical bootstrap and fitted Student t simulations for a diversified seven-ETF portfolio.

## Results

At 95% confidence, the simulated lower-tail mean of terminal wealth from $100 is $68.83 for the bootstrap and $75.61 for the fitted t simulation. These are simulated wealth values, not loss estimates.

## Method and limits

Uses a recorded adjusted-price snapshot for 2020–2022 and 5,000 one-year paths. End dates are inclusive, and returns without an observed prior close are dropped. Bootstrap draws assume independent days; fitted t log returns can produce extreme tail values.

## Reproduce

Run from the collection root with the named local data file available:

```sh
Rscript R/run_analysis.R portfolio-simulation
```

[Source](../Notebooks/portfolio-simulation.qmd) · [Executed report](portfolio-simulation.html) · [Validation record](portfolio-simulation-validation.json)
