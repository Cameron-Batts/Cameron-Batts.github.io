# Treasury Valuation and Cash Flow Analysis

Cameron Batts

Price Treasury securities, infer yields, value scheduled liabilities, and reconcile a bond ETF holding snapshot.

## Results

The STRIPS-based clean price is 57.3063 per 100 face value; the scheduled liability has a present value of $497,222.82.

## Method and limits

Cash flow discounting produces a full price. The revised workflow subtracts accrued interest to report a clean price and rejects missing prices for nonzero cash flows.

## Reproduce

Run from the collection root with the named local data file available:

```sh
Rscript R/run_analysis.R treasury-valuation
```

[Source](../Notebooks/treasury-valuation.qmd) · [Executed report](treasury-valuation.html) · [Validation record](treasury-valuation-validation.json)
