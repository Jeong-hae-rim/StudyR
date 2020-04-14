

#1. ggplot2 패키지에서 제공되는 mpg 라는 데이터 셋의 구조를 확인한다.
#이 mpg 를 데이터프레임으로 변환하여 mpg 에 저장한다.(as.data.frame())


install.packages("ggplot2")
str(ggplot2::mpg)
mpg <- as.data.frame(ggplot2::mpg)

##1-1 mpg의 구조를 확인한다.
str(mpg)

##1-2 mpg 의 행의 개수와 열의 개수를 출력한다.
dim(mpg)

##1-3 mpg의 데이터를 앞에서 10개 출력한다.
mpg %>% head(10)

##1-4 mpg의 데이터를 뒤에서 10개 출력한다.
mpg %>% tail(10)

##1-5. mpg의 데이터를 GUI 환경으로 출력한다.
View(mpg)

##1-6 mpg를 열 단위로 요약한다.
summary(mpg)

##1-7 mpg 데이터셋에서 제조사별 차량의 수를 출력한다.
mpg %>% 
  group_by(manufacturer) %>% tally()

##1-8 mpg 데이터셋에서 제조사별 그리고 모델별 차량의 수를 출력한다.
mpg %>% 
  group_by(manufacturer, model) %>% tally()




#2. 다음에 제시된 문제를 각각 2-1, 2-2 으로 넘버링 하여 해결 코드를 R로 작성한다.

##2-1. 복사본 데이터를 이용해 cty는 city로, hwy는 highway로 변수명을 수정한다.
mpg_copy <- mpg %>% rename(city=cty, highway=hwy)

##2-2. 데이터 일부를 출력해 변수 명이 바뀌었는지 확인해 본다.
mpg_copy %>% head(6)




#3. 다음에 제시된 문제를 각각 3-1, 3-2, 3-3, 3-4로 넘버링 하여 해결 코드를 R로 작성한다.

str(ggplot2::midwest)
midwest <- as.data.frame(ggplot2::midwest)

##3-1. ggplot2의 midwest 데이터를 데이터 프레임 형태로 불러와서 데이터의 특성을 파악하세요.
str(midwest)

##3-2. poptotal(전체 인구)을 total로, popasian(아시아 인구)을 asian으로 변수명을 수정하세요.
midwest <- midwest %>% rename(total=poptotal, asian=popasian)

##3-3. total, asian 변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들어 보세요.
midwest$per <- (midwest$asian/midwest$total)*100


##3-4. 아시아 인구 백분율 전체 평균을 구하고, 
##평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수를 만들어 보세요.

mean(midwest$per)

midwest$per_mean<- ifelse(midwest$per>0.4872462,"large","small")




#4. 다음에 제시된 문제를 각각 4-1, 4-2, 4-3 으로 넘버링 하여 해결 코드를 R로 작성한다.


##4-1. 자동차 배기량에 따라 고속도로 연비가 다른지 알아보려고 한다. 
##displ(배기량)이 4이하인 자동차와 5이상인 자동차 중
##어느 자동차의 hwy가 평균적으로 더 높은지 알아보자.
displ_4 <- mpg %>%  filter(displ <= 4)
displ_5 <- mpg %>%  filter(displ >= 5)

mean(displ_4$hwy) #displ(배기량)이 4이하인 자동차가 평균적으로 더 높음
mean(displ_5$hwy)

##4-2. 자동차 제조 회사에 따라 도시 연비가 다른지 알아보려고 한다.
#audi와 toyota 중 어느 manufacturer(제조회사)의 cry(도시 연비)가 평균적으로 더 높은지 알아보자.
audi <- mpg %>% filter(manufacturer=='audi')
toyota <- mpg %>% filter(manufacturer=='toyota')

mean(audi$cty)
mean(toyota$cty) #toyota가 평균적으로 더 높음


##4-3. chevrolet, ford, honda 자동차의 고속도로 연비 평균을 알아보려고 한다.
##이 회사들의 자동차를 추출한 뒤 hwy 전체 평균을 구해보자.

manufactor_3 <- mpg %>% filter(manufacturer %in% c("chevrolet", "ford", "honda"))
mean(manufactor_3$hwy)





#5.다음에 제시된 문제를 각각 5-1, 5-2 으로 넘버링 하여 해결 코드를 R로 작성한다.

##5-1. mpg 변수는 11개로 구성되어 있다. 이 중 일부만 추출해서 분석에 사용하려 한다.
##mpg 데이터에서 class(자동차 종류), cty(도시 연비)변수를 추출해 새로운 데이터를 만든다.
##새로 만든 데이터의 일부를 출력해서 두 변수로만 구성되어 있는지 확인한다.
mpg_c <- mpg %>% select(class, cty)

mpg_c %>% head(6)

##5-2. 자동차 종류에 따라 도시 연비가 다른지 알아보려고 한다.
##앞에서 추출한 데이터를 이용해서 class(자동차 종류)가 "suv"인 자동차와 "compact"인 자동차 중
##어떤 자동차의 cty가 더 높은지 알아보자.

suv <- mpg_c %>% filter(class=="suv")
compact <- mpg_c %>% filter(class=="compact")

sum(suv$cty)
sum(compact$cty) #compact가 도시 연비가 더 높다.
#mean(suv$cty)
#mean(compact$cty)



#6. 다음에 제시된 문제에 대한  해결 코드를 R로 작성한다.	

##mpg 데이터를 이용해 분석 문제를 해결한다.
##"audi"에서 생산한 자동차 중에 어떤 자동차 모델의 hwy(고속도로 연비)가 높은지 알아보려 한다.
##"audi"에서 생산한 자동차 중 hwy가 1~5위에 해당하는 자동차의 데이터를 출력한다.


mpg %>% 
  filter(manufacturer == "audi") %>% 
     arrange(desc(hwy)) %>% 
       head(5)
