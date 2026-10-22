# Cameron Batts
# Utilities for dated prices, weighted returns and historical tail summaries.
# Package installation is an explicit setup step, never a side effect of sourcing.
required <- c("data.table", "ggplot2", "MASS", "moments", "quantmod", "xts", "survival")
missing <- required[!vapply(required, requireNamespace, logical(1), quietly = TRUE)]
if (length(missing)) stop("Install required packages: ", paste(missing, collapse = ", "))
for (package in required) suppressPackageStartupMessages(library(package, character.only = TRUE))
for (package in c("jrvFinance", "rugarch")) {
  if (requireNamespace(package, quietly = TRUE)) suppressPackageStartupMessages(library(package, character.only = TRUE))
}
data.table::setDTthreads(2)

calendar_date <- function(year, month, day) {
  as.Date(ISOdate(year, month, day, tz = "UTC"))
}

spot_yield <- function(price, years, frequency = 2) {
  stopifnot(all(is.finite(price)), all(price > 0), all(years > 0), frequency > 0)
  frequency * expm1(log(100 / price) / (frequency * years))
}

weighted_returns <- function(returns, weights, discrete = TRUE) {
  values <- as.matrix(returns)
  stopifnot(ncol(values) == length(weights), all(is.finite(values)),
            all(is.finite(weights)), abs(sum(weights) - 1) < 1e-8)
  series <- drop(values %*% weights)
  if (discrete) return(series)
  if (any(series <= -1)) stop("Log returns require a portfolio return above -100%.")
  log1p(series)
}

lower_tail_summary <- function(values, confidence) {
  stopifnot(confidence > 0, confidence < 1)
  values <- as.numeric(values)
  if (!length(values) || any(!is.finite(values))) stop("Tail input must contain finite observations.")
  threshold <- unname(quantile(values, 1 - confidence, type = 7))
  tail <- values[values < threshold]
  if (!length(tail)) tail <- values[values <= threshold]
  c(VaR = threshold, ES = mean(tail))
}

market_returns <- function(ticker, date_start, date_end, discrete = TRUE) {
  history <- read_market_history(ticker, from = date_start, to = date_end)
  adjusted <- na.omit(quantmod::Ad(history))
  log_changes <- na.omit(diff(log(adjusted)))
  if (discrete) expm1(log_changes) else log_changes
}

normal_fit_plot <- function(values, showplot = TRUE) {
  values <- as.numeric(values)
  values <- values[is.finite(values)]
  fit <- MASS::fitdistr(values, "normal")
  ggplot2::ggplot(data.frame(value = values), ggplot2::aes(value)) +
    ggplot2::geom_histogram(ggplot2::aes(y = after_stat(density)), bins = 35,
                           fill = "#317eaa", color = "white") +
    ggplot2::stat_function(fun = dnorm,
      args = list(mean = fit$estimate[[1]], sd = fit$estimate[[2]]), color = "#b54b37") +
    ggplot2::labs(x = "Daily log return", y = "Density") + ggplot2::theme_minimal()
}

# Cached daily OHLC/adjusted prices are optional local inputs. End dates are inclusive.
read_market_history <- function(Symbols, from, to) {
  cache <- file.path("Data", paste0(Symbols, "-prices.csv"))
  if (file.exists(cache)) {
    tab <- read.csv(cache, check.names = FALSE)
    dates <- as.Date(tab$Date)
    selected <- dates >= as.Date(from) & dates <= as.Date(to)
    values <- xts::xts(as.matrix(tab[selected, -1]), order.by = dates[selected])
    colnames(values) <- paste(Symbols, colnames(tab)[-1], sep = ".")
    return(values)
  }
  quantmod::getSymbols(Symbols, src = "yahoo", from = from,
                       to = as.Date(to) + 1, auto.assign = FALSE)
}
