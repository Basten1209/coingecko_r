setwd("C:/Users/B-USER/Desktop/R")
library(readxl)
library(dplyr)
library(ggplot2)
library(stringr)
Modeldata <- read_excel("Model0109.xlsx")

mergedata <-merge(Modeldata, data2, by='Time', all = TRUE)

subdata2 <-mergedata[, c(1, 2, 3, 4, 5, 10,11)]
subdata3 <-na.omit(subdata2)
subdata3$ln_SF <- log(subdata3$SF.x)
subdata3$ln_price <- log(subdata3$real_Price)
subdata3$ln_stable <- log(subdata3$Stablecoin)
subdata3$ln_address <- log(subdata3$Address)
subdata3$ln_CPI <-log(subdata3$CPIIndex)
Model <-lm(ln_price ~ ln_SF+CPIYoY.x+ln_stable+ln_address, data = subdata3)

summary(Model)
Model2 <-lm(ln_price ~ ln_SF+CPIIndex+ln_stable+ln_address, data = subdata3)
summary(Model2)

Model3 <-lm(ln_price ~ ln_SF+ln_CPI+ln_stable+ln_address, data = subdata3)
summary(Model3)

plot(Model3)
