# Liability Matching and Bond Ladder Design

Cameron Batts

Value a scheduled liability, match its duration with two Treasury securities, and construct a cash flow matching bond ladder.

## Results

The liability present value is $522,898.70, with modified duration 1.2880. All five ladder cash flows passed an independent reconciliation.

## Method and limits

Duration matching approximates sensitivity to small parallel yield changes. Cash flow matching is checked separately: each of the five ladder payments funds its corresponding liability.

## Reproduce

Run from the collection root with the named local data file available:

```sh
Rscript R/run_analysis.R liability-matching
```

[Source](../Notebooks/liability-matching.qmd) · [Executed report](liability-matching.html) · [Validation record](liability-matching-validation.json)
