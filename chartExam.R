

#문제 1

(graph1 <- read.table("data/product_click.log", header=TRUE))

View(graph1)

click <- table(graph1$p001)

png("clicklog1.png", 700, 400)

barplot(click, main="세로바 그래프 실습", xlab="상품ID", ylab="클릭수", xlim=c(0, 11), ylim=c(0, 160), col=terrain.colors(10))

dev.off()

#graph2<-as.matrix.data.frame(graph1)


#문제 2

(graph2 <- read.table("data/product_click.log", header=TRUE))

View(graph2)

graph2 <- graph2[,-2]
graph2 <- substr(graph2, 9, 10)
clock <- table(graph2)

clock_lev <- as.numeric(names(clock)) 
# clock 내 데이터는 진짜 숫자가 아니라 String이므로 as.numeric()을 통해 숫자로 변형해줘야 한다.

png("clicklog2.png", 700, 400)

pie(clock, main = "파이그래프 실습", labels=paste(clock_lev,"~",clock_lev+1), col=rainbow(20))
dev.off()
