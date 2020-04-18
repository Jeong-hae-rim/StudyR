

data(GNI2014) 
str(GNI2014)
View(GNI2014)

windowsFonts(lett=windowsFont("휴먼옛체"))


png(filename = "treemap.png", width = 400, height = 700)

treemap(GNI2014, vSize="population", index=c("continent", "iso3"), title="전세계 인구 정보", fontfamily.title="lett")

dev.off()
