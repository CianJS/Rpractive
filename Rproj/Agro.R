AlpCost <- read.csv("~/Rproj/AgroandlivestockproductsCostrate.csv", encoding="EUC-KR")

DFood <- c(AlpCost$X14direct.cost[Food][1:6], AlpCost$X15direct.cost[Food][1:6])
Ifood<- c(AlpCost$X14indirect.cost[Food][1:6], AlpCost$X15indirect.cost[Food][1:6])

meanFood <- c(AlpCost$X14direct.cost[Food][7], AlpCost$X15direct.cost[Food][7])

library(ggplot2)

ggplot(AlpCost, aes(x =AlpCost$X14total.A. , y = AlpCost$X15total.B., color=AlpCost$kind)) + geom_line()
