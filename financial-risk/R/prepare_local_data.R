# Cameron Batts
# Convert a supplied local snapshot to the filenames used by these workflows.
args <- commandArgs(trailingOnly = TRUE)
if (length(args) != 2L) stop("Usage: Rscript R/prepare_local_data.R INPUT.RData DATASET_KEY")
keys <- c("treasury_market", "annual_equity_returns", "liability_market", "mortgage_survival", "mortgage_credit")
key <- args[[2]]
if (!key %in% keys) stop("Choose one of: ", paste(keys, collapse = ", "))
suppressPackageStartupMessages(library(data.table))
data_env <- new.env(parent = emptyenv())
load(args[[1]], envir = data_env)
if (key == "mortgage_survival") {
  required <- c("LOAN_ID", "start", "end", "status", "CSCORE_B", "OLTV", "PURPOSE", "OCC_STAT")
  objects <- ls(data_env)
  matches <- objects[vapply(objects, function(n) {
    x <- data_env[[n]]
    is.data.frame(x) && all(required %in% names(x))
  }, logical(1))]
  if (length(matches) != 1L) stop("Expected one interval-history table with the documented schema.")
  history <- data_env[[matches[[1]]]]
  rm(list = ls(data_env), envir = data_env)
  data_env$mortgage_history <- history
}
dir.create("Data", showWarnings = FALSE)
destination <- file.path("Data", paste0(key, ".RData"))
save(list = ls(data_env), envir = data_env, file = destination, compress = TRUE)
cat("Prepared", destination, "\n")
