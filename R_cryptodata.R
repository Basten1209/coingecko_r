install.packages("ggplot")
install.packages("dplyr")
options(repos = c(CRAN = "http://cran.rstudio.com"))

install.packages("geckor")

library(geckor)

ping()


library(dplyr)
install.packages("ggplot2")

library(ggplot2)

current_price(coin_ids = c("bitcoin", "ethereum"),
              vs_currencies = c("usd", "krw"))



btceth <- current_price(coin_ids = c("bitcoin", "ethereum"), vs_currencies = c("usd", "krw"))

current_market(coin_ids = c("cardano", "tron", "polkadot"), 
               vs_currency = "usd") %>% 
  glimpse()



cardano_history <- coin_history(coin_id = "cardano", 
                                vs_currency = "usd", 
                                days = "max")

write.csv(cardano_history, file = "cardano.csv")

btc_history <-coin_history(coin_id = "bitcoin", vs_currency = "usd", days = "max")
write.csv(btc_history, file = "btc.csv")

eth_history <-coin_history(coin_id = "ethereum", vs_currency = "usd", days = "max")


write.csv(eth_history, file = "eth.csv")

cardano_history <- coin_history(coin_id = "cardano", 
                                vs_currency = "eur", 
                                days = "max")

cardano_history %>% 
  ggplot(aes(timestamp, price)) +
  geom_line() + theme_minimal()



a <- current_price(coin_ids = c("aave", "bitcoin"),
                   vs_currencies = c("usd", "krw"))
write.csv(a, file = "aaaa.csv")