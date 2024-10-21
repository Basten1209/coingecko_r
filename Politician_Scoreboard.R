
setwd("C:/Users/B-USER/Desktop/11월 11호")
library(readxl)
library(dplyr)
library(ggplot2)
library(stringr)
scoreboard <- read_excel("Politician_Scoreboard_decrypt.xlsx") #Scoreboard Data Read
View(scoreboard)

R_scoreboard <- subset(scoreboard, Party == 'Republican') #Republican Scoreboard
D_scoreboard <- subset(scoreboard, Party == 'Democrat') #Democrat Scoreboard
House <- subset(scoreboard, Chamber == 'House') #House Scoreboard
Senate <- subset(scoreboard, Chamber == 'Senate') #Senate Scoreboard
scoreboard2 <-subset(scoreboard, Grade != 'I') #Scoreboard except 'I' Grade

summary(scoreboard)

R_grade<-as.data.frame(table(R_scoreboard$Grade)) #Republican Grade data frame
D_grade<-as.data.frame(table(D_scoreboard$Grade)) #Democrat Grade data frame

R_grade2 <- subset(R_grade, Grade != 'I') #except 'I' Grade
D_grade2 <- subset(D_grade, Grade != 'I')
House_2 <-subset(House, Grade != 'I')
Senate_2 <-subset(Senate, Grade != 'I')
grade2 <-as.data.frame(table(scoreboard2$Grade))

ggplot(R_grade, aes(x=Var1, y=Freq))+
  geom_bar(stat = "identity", width = 0.7, fill = "steelblue")+
  geom_text(aes(label = Freq), vjust = 1.5, colour = "white")


ggplot(grade2, aes(x=Var1, y=Freq))+
  geom_bar(stat = "identity", width = 0.7, fill = "steelblue")+
  geom_text(aes(label = Freq), vjust = 1.5, colour = "white")

ggplot(D_grade, aes(x=Var1, y=Freq))+
  geom_bar(stat = "identity", width = 0.7, fill = "steelblue")+
  geom_text(aes(label = Freq), vjust = 1.5, colour = "white")


ggplot(R_grade2, aes(x=Var1, y=Freq))+
  geom_bar(stat = "identity", width = 0.7, fill = "steelblue")+
  geom_text(aes(label = Freq), vjust = 1.5, colour = "white")

ggplot(D_grade2, aes(x=Var1, y=Freq))+
  geom_bar(stat = "identity", width = 0.7, fill = "steelblue")+
  geom_text(aes(label = Freq), vjust = 1.5, colour = "white")

H_Grade2 <-as.data.frame(table(House_2$Grade))
S_Grade2 <-as.data.frame(table(Senate_2$Grade))


Arizona_Score<-as.data.frame(table(scoreboard2[,c(2,3)]))

Arizona_Score<-table(scoreboard2[,c(2,3)])
Arizona_Score <- as.array(Arizona_Score)
Arizona_Score<-as.data.frame.matrix(Arizona_Score)
summary(Arizona_Score)

write.csv(Arizona_Score, file = "Arizona_Score.csv")
write.csv(D_grade, file = "Democrat.csv")
write.csv(R_grade, file = "Republican.csv")
write.csv(S_Grade2, file = "Senate.csv")
write.csv(H_Grade2, file = "House.csv")
