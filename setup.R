#!/usr/bin/env Rscript
packages <- c("caret", "MLmetrics", "mlbench", "pROC", "tidyverse")
install.packages(packages[!packages %in% installed.packages()[,"Package"]])
