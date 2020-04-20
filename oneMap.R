


k3 <- korpopmap3
k3@data[c("C행정구역별_읍면동", "행정구역별_읍면동")]


View(k3@data)


gangnam <- '강남구'
gucode1 <- k2@data[k2@data$name == guname, "code.data"]
pattern1 <- paste0('^', gucode1)
k3@data[grep(pattern1, k3@data$code.data), 
        c("code.data", "name")]


gucode2 <- grep(pattern1, k3@data$code.data)

k3@data<-k3@data[gucode2,] 
k3@polygons<-k3@polygons[gucode2] 

k3@data$name<-gsub('·','',k3@data$name) 
colnames(DONG)<-c('구별','name','일인가구')
dong <- DONG %>%filter(구별=='강남구')

k3@data<-merge(k3@data,dong,by.x='name',sort=FALSE)
mymap1 <- k3@data

mypalette <- colorNumeric(palette ='Set3' , domain = k3@data$'일인가구')
mypopup <- paste0(mymap1$name,'<br> 1인가구: ',k3@data$'일인가구')


onemap <- NULL
onemap<-leaflet(k3) %>% 
  addTiles() %>% 
  setView(lat=37.52711, lng=126.987517, zoom=12) %>%
  addPolygons(stroke =FALSE,
              fillOpacity = .7,
              popup = mypopup,
              color = ~mypalette(k3@data$일인가구)) %>% 
  addLegend( values = ~k3@data$일인가구,
             pal = mypalette ,
             title = '인구수',
             opacity = 1)
onemap		
