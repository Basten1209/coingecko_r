setwd("C:/Users/B-USER/Desktop/R")
library(readxl)
library(dplyr)
library(ggplot2)
library(stringr)
data1 <- read_excel("PlanB_SF.xlsx", sheet=2)
data2 <- read_excel("PlanB_SFF.xlsx", sheet=2)

data2$ln_price <- log(data2$real_Price)
data2$ln_CPI <-log(data2$CPIIndex)
data2$ln_M2 <-log(data2$M2Index)
data2$ln_Fed <-log(data2$FedMoney)
data2$ln_stable <-log(data2$Stable)
data2$stable2 <- data2$Stable*0.000000001
data2$Fed2 <-data2$FedMoney*0.000001

data2$CPIs <-((data2$CPIYoY+100)/100)^2
data2$CPIss <-((data2$CPIYoY+100)/100)
data2$CPIsss <-(data2$CPIYoY+100)^2
subdata <- na.omit(data2)
reg <- lm(ln_price~ln_SF, data = subdata)
reg
data2
summary(reg)

plot(reg)


plot(ln_SF~ln_price, data = subdata)
abline(reg, col = "red")

reg5 <-lm(ln_price ~ ln_SF+CPIYoY+ln_stable, data = subdata)
reg5
summary(reg5) # This One!

reg6 <-lm(ln_price ~ ln_SF+CPIsss+ln_stable, data = subdata)
summary(reg6)
reg6
plot(reg6)

reg <-lm(ln_price ~ ln_SF+l+ln_stable)
