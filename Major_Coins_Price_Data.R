
#R Script for Major_Coins_Price_Data
#Update : 2022-09-13

options(repos = c(CRAN = "http://cran.rstudio.com"))
setwd("C:/Users/B-USER/Desktop/Major_Coins_Data")
library(plyr)
library(geckor) # geckor library를 사용하겠다 선언
ping() #정상적으로 Coingekco의 data를 받아오는지 확인하는 함수, 정상적이면 실행 시 아래 console에 TRUE가 출력됩니다.

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

#Price Data만 추출

btcprice <- bitcoin[, c(1, 4)]
ethprice <- ethereum[, c(1, 4)]
solprice <- solana[, c(1, 4)]
bnbprice <- binancecoin[, c(1, 4)]
xrpprice <- ripple[, c(1, 4)]
adaprice <- cardano[, c(1, 4)]
dotprice <- polkadot[, c(1, 4)]
dogeprice <- dogecoin[, c(1, 4)]
maticprice <- polygon[, c(1, 4)]
shibprice <- shibainu[, c(1, 4)]
avaxprice <- avalanche[, c(1, 4)]
tronprice <- tron[, c(1, 4)]

#last column(당일 데이터) 제외

btcprice <- btcprice[-nrow(btcprice), ]
ethprice <-ethprice[-nrow(ethprice), ]
solprice <-solprice[-nrow(solprice), ]
bnbprice <-bnbprice[-nrow(bnbprice), ]
xrpprice <-xrpprice[-nrow(xrpprice), ]
adaprice <-adaprice[-nrow(adaprice), ]
dotprice <-dotprice[-nrow(dotprice), ]
dogeprice <-dogeprice[-nrow(dogeprice), ]
maticprice <-maticprice[-nrow(maticprice), ]
shibprice <-shibprice[-nrow(shibprice), ]
avaxprice <-avaxprice[-nrow(avaxprice), ]
tronprice <-tronprice[-nrow(tronprice), ]

#column name change

names(btcprice)[2] <-c("Bitcoin")
names(ethprice)[2] <-c("Ethereum")
names(solprice)[2] <-c("Solana")
names(bnbprice)[2] <-c("Binance Coin")
names(xrpprice)[2] <-c("Ripple")
names(adaprice)[2] <-c("Cardano")
names(dogeprice)[2] <-c("Dogecoin")
names(maticprice)[2] <-c("Polygon")
names(shibprice)[2] <-c("Shiba Inu")
names(avaxprice)[2] <-c("Avalanche")
names(tronprice)[2] <-c("Tron")

pricedata <-join_all(list(btcprice, ethprice, solprice, bnbprice,
                          xrpprice, adaprice, dogeprice, maticprice, shibprice, avaxprice, tronprice), 
                     by="timestamp", type = "full")

pricedata[is.na(pricedata)] <- 0

write.csv(pricedata, file = "Price_Data(All_Time).csv", row.names = FALSE)
