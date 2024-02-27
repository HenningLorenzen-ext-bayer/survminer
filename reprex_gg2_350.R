# override {reprex} default image upload to imgur!
knitr::opts_knit$set(upload.fun = identity)


library(survival)

data <- survival::lung
fit1 <- survfit(Surv(time, status) ~ sex, data = data)

# produces warning from ggplot2 3.5.0
survminer::ggsurvplot(
  fit = fit1,
  data = data,
  surv.median.line = "hv"
)

# works fine w/o surv.median.line
survminer::ggsurvplot(
  fit = fit1,
  data = data
)

# works fine with only one suvival curve
fit2 <- survfit(Surv(time, status) ~ 1, data = data)

survminer::ggsurvplot(
  fit = fit2,
  data = data,
  surv.median.line = "hv"
)
