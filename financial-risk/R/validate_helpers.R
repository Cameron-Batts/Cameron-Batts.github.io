# Cameron Batts
source("R/analytics_support.R")
stopifnot(identical(calendar_date(2025, 5, 3), as.Date("2025-05-03")))
stopifnot(abs(spot_yield(100, 2)) < 1e-12)
stopifnot(isTRUE(all.equal(weighted_returns(matrix(c(.10, -.10, .20, 0), ncol=2), c(.5,.5)), c(.15,-.05))))
stopifnot(isTRUE(all.equal(weighted_returns(matrix(c(.10, -.10, .20, 0), ncol=2), c(.5,.5), FALSE), log1p(c(.15,-.05)))))
stopifnot(unname(lower_tail_summary(1:10,.95)["ES"]) == 1)
stopifnot(unname(lower_tail_summary(rep(5,10),.95)["ES"]) == 5)
stopifnot(inherits(try(weighted_returns(matrix(.1,1,1),.5),silent=TRUE),"try-error"))
# Check that the ladder cash flows exactly fund the promised payment schedule.
record <- jsonlite::read_json("Reports/liability-matching-validation.json",simplifyVector=TRUE)
ladder <- record$metrics$ladder
for(i in seq_len(nrow(ladder))) {
  received <- ladder$face_value[[i]] + sum(ladder$face_value[i:nrow(ladder)] * ladder$coupon[i:nrow(ladder)]/2)
  stopifnot(abs(received - ladder$amount[[i]]) < 1e-6)
}
cat("Helper boundaries, portfolio arithmetic and all five ladder cash flows passed.\n")
