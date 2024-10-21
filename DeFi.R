
#DeFi TVL Data

library(plyr)
library(dplyr)
library(ggplot2)

options(repos = c(CRAN = "http://cran.rstudio.com"))

setwd("C:/Users/B-USER/Desktop/DeFi Data")

DeFiTVL <- read.table(file = "chains.csv", header=TRUE, sep = ",")
DeFiTVL <- DeFiTVL[, -1]
DeFiTVL[is.na(DeFiTVL)] <- 0
DeFiTVL$Date <- as.Date(DeFiTVL$Date, format = '%d/%m/%Y')
ggplot(DeFiTVL) + geom_line(aes(x = Date, y = Ethereum)) + geom_line(aes(x = Date, y = Celo))

#write.csv(DeFiTVL, file = "DeFi_TVL_chains.csv", row.names = FALSE)