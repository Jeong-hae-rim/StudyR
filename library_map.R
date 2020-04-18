


seoul_lonlat<-geocode(enc2utf8("서울"), source = "google")

cen <- c(seoul_lonlat$lon, seoul_lonlat$lat)

map <- get_googlemap(center=cen, maptype="roadmap",zoom=11, marker=seoul_lonlat)
ggmap(map)


data1 <- read.csv("data/지역별장애인도서관정보.csv")

View(data1)

data2 <- data1[,c(2,9,10)]

library(dplyr)
data3 <- data2 %>% rename(name=도서관명, lat=LAT, lon=LON)

View(data3)

ggmap(map)+
  geom_point(data=data3, aes(x=lon, y=lat), alpha=0.5, size=5, color="red")+
  geom_text(data=data3, aes(x=lon, y=lat), size=4, label=data3$name)
ggsave("library.png")
