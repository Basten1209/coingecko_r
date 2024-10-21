
#R Script for Major_Coins_volume

options(repos = c(CRAN = "http://cran.rstudio.com"))
setwd("C:/Users/B-USER/Desktop/BTC_ETH Data")
library(plyr)
library(geckor) # geckor library를 사용하겠다 선언


#History Data 불러오기
bitcoin <- coin_history(coin_id = "bitcoin", vs_currency = "usd", days = "max")
ethereum <- coin_history(coin_id = "ethereum", vs_currency = "usd", days = "max")

#volume Data만 추출
btcdata <- bitcoin[, c(1, 4, 5, 6)]
ethdata <-ethereum[, c(1, 4, 5, 6)]


#last column(당일 데이터) 제외

btcdata <- btcdata[-nrow(btcdata), ]
ethdata <-ethdata[-nrow(ethdata), ]

#column name change

names(btcdata)[2] <-c("BTC_Price")
names(btcdata)[3] <-c("BTC_Volume")
names(btcdata)[4] <-c("BTC_MarketCap")
names(ethdata)[2] <-c("ETH_Price")
names(ethdata)[3] <-c("ETH_Volume")
names(ethdata)[4] <-c("ETH_MarketCap")


BTCETH <-join_all(list(btcdata, ethdata), 
                      by="timestamp", type = "full")

BTCETH[is.na(BTCETH)] <- 0

write.csv(BTCETH, file = "BTCETH.csv", row.names = FALSE)

write.csv(BTCETH[, c(1, 2, 4)], file = "BTCETH_Price.csv", row.names = FALSE) # Price Data만 포함
write.csv(BTCETH[, c(1, 3, 5)], file = "BTCETH_Volume.csv", row.names = FALSE) #Volume Data만 포함
write.csv(BTCETH[, c(1, 4, 6)], file = "BTCETH_MarketCap.csv", row.names = FALSE) #Market Cap Data만 포함