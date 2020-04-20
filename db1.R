

library(ggplot2)
library(plotly)


#(1) iris 데이터셋을 Oracle 서버에 다음 사양으로 테이블이 생성되고 데이터들이 저장되도록 R 코드를 구현한다.

iris <- as.data.frame(iris)
View(iris)
str(iris)

head(iris)
names(iris) <-c("SLENGTH", "SWIDTH", "PLENGTH", "PWIDTH", "SPECIES")

dbWriteTable(conn,"iris",iris)


#(2) IRIS 테이블의 내용을 모두 읽어 온다.

result5 <-dbReadTable(conn,"iris")
result5

#(3) 다음과 같은 결과가 출력되도록 ggplot() 으로 시각화 R 코드를 구현한다.(2가지)

ggplot(result5, aes(x=SLENGTH, y=SWIDTH,  color= SPECIES))+geom_point()
ggsave("db1.jpg")

ggplot(result5, aes(x=PLENGTH, y=PWIDTH,  color= SPECIES))+geom_point()
ggsave("db2.jpg")
