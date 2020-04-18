

#[문제1] mpg 데이터 셋의 cty(도시 연비)와 hwy(고속도로 연비) 간에 어떤 관계가 있는지 알아보려고 한다.
#x축은 cty, y축은 hwy로 된 산점도를 만들어 본다. 다음 그래프와 동일한 내용으로 출력한다.

ggplot(mpg, aes(x=cty, y=hwy)) + geom_point(pch=3) + labs(x="도시연비", y="고속도로연비") + theme_bw()

?ggplot



#[ 문제 2 ] mpg 데이터 셋에서 구동방식(drv)별 차량의 수를 다음과 같이 보여지도록 바 그래프로 출력한다.

ggplot(mpg, aes(x=drv)) + geom_bar(fill=c("red","green","blue")) + labs(x="", y="")

?geom_bar

barplot(table(mpg$drv), col=c("red","green","blue"))


#[ 문제 3 ]

boxplot(hwy~manufacturer,data=mpg, xlab = "", ylab = "고속도로연비", ylim=c(5, 40), 
        col=heat.colors(15), las=2, main="*제조사별고속도로연비*", col.main="magenta")

