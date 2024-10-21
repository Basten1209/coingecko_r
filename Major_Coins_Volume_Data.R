

#R Script for Major_Coins_volume

options(repos = c(CRAN = "http://cran.rstudio.com"))
setwd("C:/Users/B-USER/Desktop/Major_Coins_Data")
library(plyr)
library(geckor) # geckor library를 사용하겠다 선언

#Coingecko에서 지원하는 코인의 coin_id check
#coins <- supported_coins() #사용 시 주석처리 지우고 이용


#History Data 불러오기
bitcoin <- coin_history(coin_id = "bitcoin", vs_currency = "usd", days = "max")
ethereum <- coin_history(coin_id = "ethereum", vs_currency = "usd", days = "max")
solana <- coin_history(coin_id = "solana", vs_currency = "usd", days = "max")
binancecoin<- coin_history(coin_id = "binancecoin", vs_currency = "usd", days = "max")
ripple <- coin_history(coin_id = "ripple", vs_currency = "usd", days = "max")
cardano <- coin_history(coin_id = "cardano", vs_currency = "usd", days = "max")
polkadot <- coin_history(coin_id = "polkadot", vs_currency = "usd", days = "max")
dogecoin <- coin_history(coin_id = "dogecoin", vs_currency = "usd", days = "max")
polygon <- coin_history(coin_id = "matic-network", vs_currency = "usd", days = "max")
shibainu <- coin_history(coin_id = "shiba-inu", vs_currency = "usd", days = "max")
avalanche <- coin_history(coin_id = "avalanche-2", vs_currency = "usd", days = "max")
tron <- coin_history(coin_id = "tron", vs_currency = "usd", days = "max")

#volume Data만 추출

btcvolume <- bitcoin[, c(1, 5)]
ethvolume <- ethereum[, c(1, 5)]
solvolume <- solana[, c(1, 5)]
bnbvolume <- binancecoin[, c(1, 5)]
xrpvolume <- ripple[, c(1, 5)]
adavolume <- cardano[, c(1, 5)]
dotvolume <- polkadot[, c(1, 5)]
dogevolume <- dogecoin[, c(1, 5)]
maticvolume <- polygon[, c(1, 5)]
shibvolume <- shibainu[, c(1, 5)]
avaxvolume <- avalanche[, c(1, 5)]
tronvolume <- tron[, c(1, 5)]

#last column(당일 데이터) 제외

btcvolume <- btcvolume[-nrow(btcvolume), ]
ethvolume <-ethvolume[-nrow(ethvolume), ]
solvolume <-solvolume[-nrow(solvolume), ]
bnbvolume <-bnbvolume[-nrow(bnbvolume), ]
xrpvolume <-xrpvolume[-nrow(xrpvolume), ]
adavolume <-adavolume[-nrow(adavolume), ]
dotvolume <-dotvolume[-nrow(dotvolume), ]
dogevolume <-dogevolume[-nrow(dogevolume), ]
maticvolume <-maticvolume[-nrow(maticvolume), ]
shibvolume <-shibvolume[-nrow(shibvolume), ]
avaxvolume <-avaxvolume[-nrow(avaxvolume), ]
tronvolume <-tronvolume[-nrow(tronvolume), ]

#column name change

names(btcvolume)[2] <-c("Bitcoin")
names(ethvolume)[2] <-c("Ethereum")
names(solvolume)[2] <-c("Solana")
names(bnbvolume)[2] <-c("Binance Coin")
names(xrpvolume)[2] <-c("Ripple")
names(adavolume)[2] <-c("Cardano")
names(dogevolume)[2] <-c("Dogecoin")
names(maticvolume)[2] <-c("Polygon")
names(shibvolume)[2] <-c("Shiba Inu")
names(avaxvolume)[2] <-c("Avalanche")
names(tronvolume)[2] <-c("Tron")

volumedata <-join_all(list(btcvolume, ethvolume, solvolume, bnbvolume,
                           xrpvolume, adavolume, dogevolume, maticvolume, shibvolume, avaxvolume, tronvolume), 
                      by="timestamp", type = "full")

volumedata[is.na(volumedata)] <- 0

write.csv(volumedata, file = "Volume_Data(All_Time).csv", row.names = FALSE)