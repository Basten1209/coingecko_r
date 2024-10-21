# R Script for Crypto data (time, price, total volume(24h), market cap)


#초기 세팅 1: 아래 두 줄을 긁어서 ctrl + enter 해주세요. 이 두 줄은 최초 1회만 실행하면 됩니다.

options(repos = c(CRAN = "http://cran.rstudio.com")) # 오류 핸들링을 위한 코드
install.packages("geckor") # Coingecko API(geckor)를 사용하기 위한 package 설치





#초기 세팅 2: 아래 세 줄을 긁어서 ctrl + enter 해주세요.

setwd("C:/R_coingecko") # csv 파일을 다운로드 받을 폴더 주소를 ####에 작성해주세요.

library(geckor) # geckor library를 사용하겠다 선언
ping() #정상적으로 Coingekco의 data를 받아오는지 확인하는 함수, 정상적이면 실행 시 아래 console에 TRUE가 출력됩니다.





## 아래는 각 case에 대한 코드입니다. 주석 내용에 맞춰서 내용을 바꾸고, case의 내용 전부 긁어서 ctrl+enter 시 파일이 생성됩니다.




## 현재 시각 기준 data 추출





# 1. 특정 가상자산의 현재 price, market cap, 24h volume, 24h price change (%) 데이터 (여러개 동시 비교 가능)

example1 <- current_price(
              coin_ids = c("bitcoin", "ethereum"),
              vs_currencies = c("usd", "krw")) ## 예시 부분에 필요한 코인과 기준화폐로 변경하여 작성하면 됩니다.

write.csv(example1, file = "example1.csv") ## 받을 excel 파일명을 example1에 작성해주세요.





# 2. 특정 가상자산의 특정 거래소에서의 data(last price, volume 스프레드, 24h 거래량, BTC/ETH/USD 기준 last price 및 volume,
                                        ## 2% 상승 및 하락을 위한 usd)
                                        ## BTC, ETH의 경우 다른 데이터들이 섞여서 나와 추가적인 filtering이 필요합니다.

example2 <- coin_tickers(coin_id = "bitcoin",
                         exchange_id = "upbit") ## 예시 부분에 필요한 코인, 거래소로 변경하여 작성하면 됩니다.

write.csv(example2, file = "upbitbtc.csv") ## 받을 excel 파일명을 example2에 작성해주세요.





# 3. 특정 가상자산의 현재 market data(advanced)
                       ## current price, market cap, 24h high/low, 24h change(price, market cap), supply, circulating,
                       ## ath(all time high), atl(all time low), ath, atl 대비 change(price, percent),
                       ## 특정 기간별 price 변화율(1h, 24h, 7d, 14d, 30d, 200d, 1y)

example3 <- current_market(coin_ids = c("bitcoin", "ethereum", "solana", "cardano", "BNB", "polkadot"),
                           vs_currency = "usd") ## 예시 부분에 필요한 코인, 기준화폐로 변경하여 작성하면 됩니다.

write.csv(example3, file = "example3.csv") ## 받을 excel 파일명을 example3에 작성해주세요.





# 4. 특정 가상자산의 현재 price/market cap/24h vol/24h price change(%)

example4 <- current_price(coin_ids = c("aave", "bitcoin"),
                          vs_currencies = c("usd", "krw")) ## 예시 부분에 필요한 코인, 화폐로 변경하여 작성하면 됩니다.

write.csv(example4, file = "example4.csv") ## 받을 excel 파일명을 example4에 작성해주세요.





# 5. exchange rate (all currency/BTC)

example5 <- exchange_rate()
write.csv(example5, file = "example5.csv") ## 받을 excel 파일명을 example5에 작성해주세요.





# 6. exchange rate (특정 currency/BTC)

example6 <- exchange_rate(currency = c("usd", "krw", "eth")) ## 예시 부분에 필요한 코인/화폐로 변경하여 작성하면 됩니다.
write.csv(example6, file = "example6.csv") ## 받을 excel 파일명을 example6에 작성해주세요.





# 7. Coingecko 기준 24h search popularity top 7 coins

example7 <- trending_coins()
write.csv(example7, file = "example7.csv") ## 받을 excel 파일명을 example7에 작성해주세요.






## 금일 기준 최근 n일 data 추출





# 8. 특정 가상자산의 history(price, market cap, total volume) 데이터 (최근 n일)

example8 <- coin_history(coin_id = "ripple",
                         vs_currency = "usd", 
                         days = "max") ## 예시 부분에 필요한 코인, 화폐, 기간으로 변경하여 작성하면 됩니다.
                                       ## days의 값이 1인 경우(하루 치 데이터) : 몇 분 간격 데이터
                                       ## days의 값이 2~90인 경우 : 1시간 간격 데이터
                                       ## days의 값이 90 초과인 경우 : 1일 간격 데이터

write.csv(example8, file = "trx.csv") ## 받을 excel 파일명을 example8에 작성해주세요.





# 9. 특정 가상자산의 history OHLC(open-high-low-close) 데이터 (최근 n일)

example9 <- coin_history_ohlc(coin_id = "bitcoin",
                              vs_currency = "usd",
                              days = "max") ## 예시 부분에 필요한 코인, 화폐, 기간으로 변경하여 작성하면 됩니다.
                                            ## days의 경우 : 1, 7, 14, 30, 90, 180, 365, max 만 가능합니다.
                                            ## days = 1 : 30분 candle data
                                            ## days = 7, 14, 30 : 4시간 candle data
                                            ## days = 90, 180, 365, max : 4일 candle data


write.csv(example9, file = "example9.csv") ## 받을 excel 파일명을 example9에 작성해주세요.





## 특정 기간 data 추출





# 10. 특정 가상자산의 특정 기간 market data

example10 <- coin_history_range(coin_id = "ethereum",
                               vs_currency = "usd",
                               from = as.POSIXct("2021-01-01 10:00:00",
                               tz = "UTC"),
                               to = as.POSIXct("2021-01-01 18:00:00",
                               tz = "UTC")) ## 예시 부분에 필요한 코인, 화폐, 기간으로 변경하여 작성하면 됩니다.
                                            ## 90일 이하의 기간은 1시간별 data가, 90일 초과의 기간은 일간 data가 나옵니다.

write.csv(example10, file = "example10.csv") ## 받을 excel 파일명을 example10에 작성해주세요.





## 특정 일자 data 추출





# 11. 특정 가상자산의 특정 일자 market data(snapshot)

example11 <- coin_history_snapshot(coin_id = "solana",
                                  date = as.Date("2021-01-01"),
                                  vs_currencies = c("usd", "krw"))
                                  ## 예시 부분에 필요한 코인, 기간, 화폐로 변경하여 작성하면 됩니다.

write.csv(example11, file = "example11.csv") ## 받을 excel 파일명을 example11에 작성해주세요.


