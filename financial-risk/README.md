# Financial Risk Analytics in R

Cameron Batts

Eight reproducible analyses covering Treasury valuation, retirement scenarios, liability matching, market risk and mortgage default.

## Analyses

| Analysis | Verified result |
|---|---|
| [Treasury Valuation and Cash Flow Analysis](Reports/treasury-valuation.md) | The STRIPS-based clean price is 57.3063 per 100 face value; the scheduled liability has a present value of $497,222.82. |
| [Retirement Wealth Simulation](Reports/retirement-wealth.md) | Median five-year equity wealth is $2,701,401, compared with $2,598,073 for the prefunded STRIPS strategy. The corresponding fifth-percentile wealth values are $1,067,599 and $1,146,281. |
| [Liability Matching and Bond Ladder Design](Reports/liability-matching.md) | The liability present value is $522,898.70, with modified duration 1.2880. All five ladder cash flows passed an independent reconciliation. |
| [Portfolio Return and Tail Risk Simulation](Reports/portfolio-simulation.md) | At 95% confidence, the simulated lower-tail mean of terminal wealth from $100 is $68.83 for the bootstrap and $75.61 for the fitted t simulation. These are simulated wealth values, not loss estimates. |
| [Portfolio Volatility and Risk Model Comparison](Reports/volatility-models.md) | GJR-GARCH has the lowest training-sample AIC among the three specifications. All three recorded zero 95% one-day VaR exceedances during the 30-day test window, which is too short to establish reliable tail-risk performance. |
| [Portfolio Tail Risk and Hedge Sizing](Reports/portfolio-hedging.md) | Five-day 99% expected shortfall is approximately $8.98 million on a $100 million illustrative position. The delta-only scenario uses 234 contracts and reduces simulated expected shortfall by 7.51%. |
| [Mortgage Default Survival Analysis](Reports/mortgage-survival.md) | The exploratory comparison covers 304,709 loans. Categorical-coefficient warnings make the scenario estimates provisional: estimated survival is 95.26% through month 120 and a 0.0619% probability of default during month 120 under the model. |
| [Mortgage Default and Loan-to-Value Sensitivity](Reports/mortgage-sensitivity.md) | The hypothetical default probability changes from 3.50% to 4.57% over 61 months when loan-to-value rises by 10 points. The fitted hazard ratio is 1.3127. |

## Run locally

Use R with the package versions recorded in `Reports/package_versions.csv`. Install the dependencies with `Rscript install.R`. From this collection root, run `Rscript R/run_analysis.R retirement-wealth`, replacing the final argument with the desired analysis slug. Quarto can also render the `.qmd` sources using the supplied project configuration.

The execution reports were rendered using knitr and R Markdown. The Quarto command itself has not been separately tested. Each analysis has its own session record and aggregate validation JSON.

Local input files belong in `Data/`; see its README for schemas. To normalize a supplied snapshot, run `Rscript R/prepare_local_data.R /path/to/input.RData mortgage_survival`, using the corresponding documented dataset key. Historical loan records and market price caches are excluded from the published source. Market workflows can download prices when caches are absent; refreshed adjusted prices can change the results. The snapshot manifest identifies the exact cached files used here.

Run `Rscript R/validate_helpers.R` to check weighted-return arithmetic, date handling, tail boundaries and the bond-ladder cash flow reconciliation after running the liability workflow.

The shared utilities are new implementations. Package dependencies retain their own licenses.
