



myhome_lonlat<-geocode(enc2utf8("인천광역시 부평구 안남로 123번길 46"), source = "google")


mh <- myhome_lonlat
lon <- mh$lon
lat <- mh$lat
msg <- '<strong><a href="http://www.multicampus.co.kr" style="text-decoration:none" >나의 집</a></strong><hr>멀티 캠퍼스에서 2시간 떨어져 있는 곳'
my_map <- leaflet() %>% setView(lng = mh$lon, lat = mh$lat, zoom = 16) %>% addTiles() %>% 
  addCircles(lng = lon, lat = lat, color='magenta', popup = msg )
my_map
