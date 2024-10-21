setwd("C:/Users/B-USER/Desktop/R")
library(readxl)
library(dplyr)
library(ggplot2)
library(stringr)
Modeldata <- read_excel("Model0109.xlsx")

mergedata <-merge(Modeldata, data2, by='Time', all = TRUE)

data <-mergedata[, c(1, 2, 3, 4, 5, 11, 12)]
data <- na.omit(data)
data$ln_SF <- log(data$SF.x)
data$ln_price <- log(data$real_Price)
data$ln_stable <- log(data$Stablecoin)
data$ln_address <- log(data$Address)
data$ln_CPI <-log(data$CPIIndex)

Model <-lm(ln_price ~ ln_SF+CPIIndex+ln_stable+ln_address, data = data)
summary(Model)

plot(Model)