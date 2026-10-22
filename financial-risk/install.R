# Cameron Batts
packages <- c("data.table", "ggplot2", "MASS", "moments", "quantmod", "xts",
              "survival", "jrvFinance", "rugarch", "knitr", "rmarkdown", "jsonlite", "digest")
missing <- packages[!vapply(packages, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) install.packages(missing, repos = "https://cloud.r-project.org")
