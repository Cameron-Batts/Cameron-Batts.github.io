run_analysis <- function() {
# Cameron Batts
# Run from the project root: Rscript R/run_analysis.R retirement-wealth
args <- commandArgs(trailingOnly = TRUE)
slug <- args[[1]]
source("R/analytics_support.R")
source_file <- file.path("Notebooks", paste0(slug, ".qmd"))
text <- readLines(source_file, warn = FALSE)
stopifnot(text[[1]] == "---")
front_end <- which(text == "---")[[2]]
title <- sub('^title: "(.*)"$', '\\1', text[grepl("^title:", text)])
body <- text[-seq_len(front_end)]
body <- body[!grepl("^#\\|",body)]
# The execution record is also the environment used for the rendered report.
writeLines(capture.output(sessionInfo()), file.path("Reports", paste0(slug, "-session.txt")))
pkgs <- installed.packages()[, c("Package", "Version"), drop = FALSE]
write.csv(pkgs, file.path("Reports", "package_versions.csv"), row.names = FALSE)
header <- c("---", paste0('title: "', title, '"'), 'author: "Cameron Batts"',
            "output:", "  html_document:", "    toc: true", "    self_contained: true", "---", "",
            "```{r setup, include=FALSE}",
            'knitr::opts_chunk$set(error=FALSE, warning=TRUE, message=FALSE, fig.width=9, fig.height=5.5)',
            "```", "")
intermediate <- paste0(".render-",slug,".Rmd")
writeLines(c(header,body),intermediate)
on.exit(unlink(intermediate))
env <- new.env(parent = globalenv())
started <- Sys.time()
tryCatch({
  rmarkdown::render(intermediate, output_file=paste0(slug,".html"),
                    output_dir="Reports", envir=env, quiet=TRUE, clean=TRUE)
  record <- list(status="executed", elapsed_seconds=as.numeric(difftime(Sys.time(),started,units="secs")))
  keep <- switch(slug,
    "treasury-valuation"=c("strips.clean.price","total.pv","total.mv"),
    "retirement-wealth"=c("AIC.n","AIC.t"),
    "liability-matching"=c("pv.liab","dmod.liab","pcpb","ladder"),
    "portfolio-simulation"=c("AIC_n","AIC_t","boot_VaRES","param_VaRES"),
    "volatility-models"=c("model.compare","results"),
    "portfolio-hedging"=c("ES0_loss","beta_port","Nc","ES_hedged","pct_cut"),
    "mortgage-survival"=c("hyp.cscore","hyp.oltv"),
    "mortgage-sensitivity"=c("sim.age","F1","F2"),character())
  record$metrics <- lapply(setNames(keep,keep), function(n) get(n,envir=env))
  if(slug=="retirement-wealth") record$metrics$terminal_wealth <- list(
    equity=list(median=median(env$wend.1),lower_tail=lower_tail_summary(env$wend.1,.95)),
    strips=list(median=median(env$wend.2),lower_tail=lower_tail_summary(env$wend.2,.95)))
  if(slug=="mortgage-survival") {
    record$metrics$loans <- uniqueN(env$mortgage_history$LOAN_ID)
    record$metrics$model_AIC <- as.data.frame(AIC(env$Model.CSCORE,env$Model.OLTV,env$Model.PURPOSE,env$Model.OCC,env$Model.ALL))
    record$metrics$survival_120 <- env$data.hypo.default[end==120,S_D]
    record$metrics$default_month_120 <- env$data.hypo.default[end==120,P_D_t]
  }
  if(slug=="mortgage-sensitivity") record$metrics$hazard_ratio_10_ltv <- unname(exp(coef(env$DefaultModel)["OLTV"]*10))
  jsonlite::write_json(record,file.path("Reports",paste0(slug,"-validation.json")),pretty=TRUE,auto_unbox=TRUE, digits=12)
  cat("COMPLETED",slug,"\n")
},error=function(e){
  jsonlite::write_json(list(status="blocked",error=conditionMessage(e)),file.path("Reports",paste0(slug,"-validation.json")),pretty=TRUE,auto_unbox=TRUE)
  stop(e)
})

}
run_analysis()
