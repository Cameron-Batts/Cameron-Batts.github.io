# Local data inputs

Place the following files in this directory for local execution. Raw records are excluded from publication.

## treasury_market.RData

- `ci`: 119 rows; columns: `maturity`, `price`.
- `coupons`: 345 rows; columns: `maturity`, `coupon`, `pbid`, `pask`.
- `sp`: 90 rows; columns: `maturity`, `price`.
- `TLT_holdings`: 41 rows; columns: `maturity`, `coupon`, `face`.

## annual_equity_returns.RData

- `lcap_data`: 96 rows; columns: `year`, `lcap`.

## liability_market.RData

- `ci`: 119 rows; columns: `maturity`, `ci_price`.
- `coupons`: 345 rows; columns: `maturity`, `coupon`, `bd_price`.
- `sp`: 90 rows; columns: `maturity`, `sp_price`.

## mortgage_survival.RData

- `mortgage_history`: 9,128,461 rows; columns: `LOAN_ID`, `start`, `end`, `status`, `CSCORE_B`, `OLTV`, `PURPOSE`, `OCC_STAT`.

## mortgage_credit.RData

- `Data_A`: 100,000 rows; columns: `LOAN_ID`, `ORIG_CHN`, `Seller.Name`, `ORIG_RT`, `ORIG_AMT`, `ORIG_TRM`, `ORIG_DTE`, `FRST_DTE`, `OLTV`, `OCLTV`, `NUM_BO`, `DTI`, `CSCORE_B`, `FTHB_FLG`, `PURPOSE`, `PROP_TYP`, `NUM_UNIT`, `OCC_STAT`, `STATE`, `ZIP_3`, `MI_PCT`, `CSCORE_C`, `MI_TYPE`, `RELOCATION_FLG`, `CSCORE_MN`, `ORIG_VAL`.
- `Data_P`: 2,417,630 rows; columns: `LOAN_ID`, `Monthly.Rpt.Prd`, `Servicer.Name`, `LAST_RT`, `LAST_UPB`, `Loan.Age`, `Months.To.Legal.Mat`, `Adj.Month.To.Mat`, `Maturity.Date`, `MSA`, `Delq.Status`, `MOD_FLAG`, `Zero.Bal.Code`, `ZB_DTE`, `LPI_DTE`, `FCC_DTE`, `DISP_DT`, `FCC_COST`, `PP_COST`, `AR_COST`, `IE_COST`, `TAX_COST`, `NS_PROCS`, `CE_PROCS`, `RMW_PROCS`, `O_PROCS`, `NON_INT_UPB`, `PRIN_FORG_UPB_FHFA`, `REPCH_FLAG`, `PRIN_FORG_UPB_OTH`, `TRANSFER_FLG`, `ORIG_AMT`.
- `hpi_msa`: 211,246 rows; columns: `yearmon`, `MSA`, `hpi`, `spi`.
- `rates`: 600 rows; columns: `yearmon`, `rate`.
- `ue_msa`: 154,050 rows; columns: `MSA`, `yearmon`, `ue`.

## Market price caches

Optional `TICKER-prices.csv` files for VTI, VEA, VWO, BND, VNQ, GLD, QQQ and SPY. Columns: `Date`, `Open`, `High`, `Low`, `Close`, `Volume`, `Adjusted`. Prices must cover the requested interval. The price helper treats end dates as inclusive.
