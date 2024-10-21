#BTC 외 다른 Data 상관관계 분석

library(dplyr)
library(readxl)
options(repos = c(CRAN = "http://cran.rstudio.com"))

setwd("C:/Users/B-USER/Desktop/BTC_Cor")

rawdata <- read.csv(file = "aaaa.csv", header = TRUE)

rawdata <-read_xlsx("BTC_Cor.xlsx")
