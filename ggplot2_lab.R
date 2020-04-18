

#Q1. mpg 데이터의 cty(도시 연비)와 hwy(고속도로 연비) 간에 어떤 관계가 있는지 알아보려고 합니다. 
#x축은 cty, y축은 hwy로 된 산점도를 만들어 본다.


ggplot(mpg, aes(x = cty, y = hwy)) + geom_point(color="blue")

ggsave("result1.png")


#Q2. 자동차 중에서 어떤 class(자동차 종류)가 가장 많은지 알아보려고 한다. 
#자동차 종류별 빈도를 표현한 막대 그래프를 만들어 본다.

ggplot(mpg, aes(x=factor(class))) + geom_bar(aes(fill=factor(drv)), alpha=1.0)

ggsave("result2.png")


#Q3. 미국 지역별 인구통계 정보를 담은 ggplot2 패키지의 midwest 데이터를 
#이용해서 전체 인구와 아시아인 인구 간에 어떤 관계가 있는지 알아보려고 한다. 
#x축은 poptotal(전체 인구), y축은 popasian(아시아인 인구)으로 된 산점도를 만들어 보세요.
#전체 인구는 50만 명 이하, 아시아인 인구는 1만 명 이하인 지역만 산점도에 표시되게 설정한다.

ggplot(midwest, aes(x=poptotal, y=popasian)) + geom_point() + coord_cartesian(xlim=c(0, 500000), ylim=c(0, 10000))

ggsave("result3.png")


#Q4. class(자동차 종류)가 "compact", "subcompact", "suv"인 자동차의 
#cty(도시 연비)가 어떻게 다른지 비교해보려고 합니다. 세개 차종의 cty를 나타낸 상자 그림을 만들어본다.


class_3 <- mpg %>% filter(class=='compact'|class=='subcompact'|class=='suv')

ggplot(class_3, aes(x=class, y=cty)) + geom_boxplot()

ggsave("result4.png")


#Q5. product_click.log 파일을 가지고 클릭된 상품의 갯수를 가지고 바 그래프로 출력한다

product <- read.table("data/product_click.log")

View(product)

count_p <- table(product$V2)
count_p <- as.data.frame(count_p)
count_p <- count_p %>% rename(V2=Var1, Count=Freq)
View(count_p)

ggplot(data=count_p, aes(x=V2, y=Count)) + geom_bar(aes(fill=V2), stat="identity")

ggsave("result5.png")


#Q6. product_click.log 파일을 가지고 요일별 상품 클릭 횟수를 계산하여  바 그래프로 출력한다.
#(x축은 요일명)

product_log <- product$V1

product_date <- substr(product_log, 1, 8)

product_date <- as.Date(product_date, format="%Y%m%d")

product_date2 <- weekdays(product_date)

product_date3 <- table(product_date2)
product_date4 <- as.data.frame(product_date3)
product_date5 <- product_date4 %>% rename(day=product_date2, Count=Freq)
View(product_date5)

ggplot(data=product_date5, aes(x=day, y=Count)) + geom_bar(aes(fill=day), stat="identity")  + labs(x="요일", y="클릭수") + theme_light()

ggsave("result6.png")
