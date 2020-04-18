

sec <- format(Sys.time(), '%S')

my_lonlat<-geocode(enc2utf8("부평구"), source = "google")

lon <- my_lonlat$lon
lat <- my_lonlat$lat
cen <- c(lon,lat)


if(sec>=0 & sec < 15){
  my_map <- get_googlemap(center=cen, maptype="terrain",zoom=5, marker=my_lonlat)
  Sys.sleep(1)
  ggmap(my_map)
}
if(sec >=15 & sec < 30){
  my_map <- get_googlemap(center=cen, maptype="satellite",zoom=5, marker=my_lonlat)
  Sys.sleep(1)
  ggmap(my_map)
}
if(sec >= 30 & sec < 45){
  my_map <- get_googlemap(center=cen, maptype="roadmap",zoom=5, marker=my_lonlat)
  Sys.sleep(1)
  ggmap(my_map)
}
if(sec >= 45 & sec < 60){
  my_map <- get_googlemap(center=cen, maptype="hybrid",zoom=5, marker=my_lonlat)
  Sys.sleep(1)
  ggmap(my_map)
}   

ggmap(my_map)+labs(title="부평구 내 동네", x="경도", y="위도") + geom_text(aes(x=mh$lon, y=mh$lat, label="부평구 내동네", vjust=0, hjust=0))
ggsave("mymap.png")
