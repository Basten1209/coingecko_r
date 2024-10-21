

#R Script for Major_Coins_Market_Cap

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

#market Data만 추출

btcmarket <- bitcoin[, c(1, 6)]
ethmarket <- ethereum[, c(1, 6)]
solmarket <- solana[, c(1, 6)]
bnbmarket <- binancecoin[, c(1, 6)]
xrpmarket <- ripple[, c(1, 6)]
adamarket <- cardano[, c(1, 6)]
dotmarket <- polkadot[, c(1, 6)]
dogemarket <- dogecoin[, c(1, 6)]
maticmarket <- polygon[, c(1, 6)]
shibmarket <- shibainu[, c(1, 6)]
avaxmarket <- avalanche[, c(1, 6)]
tronmarket <- tron[, c(1, 6)]

#last column(당일 데이터) 제외

btcmarket <- btcmarket[-nrow(btcmarket), ]
ethmarket <-ethmarket[-nrow(ethmarket), ]
solmarket <-solmarket[-nrow(solmarket), ]
bnbmarket <-bnbmarket[-nrow(bnbmarket), ]
xrpmarket <-xrpmarket[-nrow(xrpmarket), ]
adamarket <-adamarket[-nrow(adamarket), ]
dotmarket <-dotmarket[-nrow(dotmarket), ]
dogemarket <-dogemarket[-nrow(dogemarket), ]
maticmarket <-maticmarket[-nrow(maticmarket), ]
shibmarket <-shibmarket[-nrow(shibmarket), ]
avaxmarket <-avaxmarket[-nrow(avaxmarket), ]
tronmarket <-tronmarket[-nrow(tronmarket), ]

#column name change

names(btcmarket)[2] <-c("Bitcoin")
names(ethmarket)[2] <-c("Ethereum")
names(solmarket)[2] <-c("Solana")
names(bnbmarket)[2] <-c("Binance Coin")
names(xrpmarket)[2] <-c("Ripple")
names(adamarket)[2] <-c("Cardano")
names(dogemarket)[2] <-c("Dogecoin")
names(maticmarket)[2] <-c("Polygon")
names(shibmarket)[2] <-c("Shiba Inu")
names(avaxmarket)[2] <-c("Avalanche")
names(tronmarket)[2] <-c("Tron")

marketdata <-join_all(list(btcmarket, ethmarket, solmarket, bnbmarket,
                          xrpmarket, adamarket, dogemarket, maticmarket, shibmarket, avaxmarket, tronmarket), 
                     by="timestamp", type = "full")

marketdata[is.na(marketdata)] <- 0

write.csv(marketdata, file = "Market_Cap_Data(All_Time).csv", row.names = FALSE)