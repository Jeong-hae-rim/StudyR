

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

png("clicklog2.png", 700, 400)

pie(clock, main = "파이그래프 실습", col=rainbow(20))

dev.off()
