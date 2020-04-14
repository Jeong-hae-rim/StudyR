

#7. 다음에 제시된 문제를 각각 7-1, 7-2, 7-3, 7-4 로 넘버링 하여 해결 코드를 R로 작성한다.

##7-1. mpg 데이터 복사본을 만들고, cty와 hwy를 더한 '합산 연비 변수'를 추가하시오.
mpg_copy <- mpg %>% filter(cty,hwy) %>%  mutate(fuel=cty+hwy)

##7-2. 앞에서 만든 '합산 연비 변수'를 2로 나눠 '평균 연비 변수를 추가하시오.
mpg_copy <- mpg_copy %>% mutate(fuel_mean=fuel/2)

##7-3. '평균 연비 변수'가 가장 높은 자동차 3종의 데이터를 출력하시오.
mpg_copy %>% arrange(desc(fuel_mean)) %>% head(3)

##7-4. 1~3번 문제를 해결할 수 있는 하나로 연결된 dplyr 구문을 만들어 출력하시오.
##데이터는 복사본 대신 mpg 원본을 활용한다.
mpg %>% mutate(fuel=cty+hwy, fuel_mean=fuel/2) %>% arrange(desc(fuel_mean)) %>% head(3)




#8.다음에 제시된 문제를 각각 8-1, 8-2, 8-3, 8-4 로 넘버링 하여 해결 코드를 R로 작성한다.

##8-1. mpg 데이터의 class는 "suv", "compact" 등 자동차를 특징에 따라 일곱 종류로 분류한 변수이다.
##어떤 차동의 연비가 높은지 비교해보려고 한다. calss별 cty 평균을 구하시오.
mpg %>% group_by(class) %>% summarise(class_cty = mean(cty))

##8-2. 앞 문제의 출력 결과는 class 값 알파벳 순으로 정렬되어 있다.
##어떤 차종의 도시 연비가 높은지 쉽게 알아볼 수 있도록 cty 평균이 높은 순으로 정렬해 출력하라.
mpg %>% group_by(class) %>% summarise(class_cty = mean(cty)) %>% arrange(desc(class_cty))

##8-3. 어떤 회사 자동차의 hwy(고속도로 연비)가 가장 높은지 알아보려고 한다.
## hwy 평균이 가장 높은 회사 세 곳을 출력하라.
mpg %>% group_by(manufacturer) %>% 
  summarise(manu_hwy = mean(hwy)) %>% 
  arrange(desc(manu_hwy)) %>% 
  head(3)

##8-4. 어떤 회사에서 "compact"(경차) 차종을 가장 많이 생산하는지 알아보려고 한다.
##각 회사 별 "compact"차종 수를 내림차순으로 정렬해 출력하라.
mpg %>% 
  filter(class=='compact') %>% 
  group_by(manufacturer) %>% 
  summarise(amount = n()) %>% 
  arrange(desc(amount))




#9. 다음에 제시된 문제를 각각 9-1, 9-2 로 넘버링하여 해결 코드를 R로 작성한다.

fuel <- data.frame(fl = c("c", "d", "e", "p", "r"),
                   price_fl = c(2.35, 2.38, 2.11, 2.76, 2.22),
                   stringsAsFactors = F)

fuel

mpg

##9-1. mpg 데이터에는 연료 종류를 나타낸 f1 변수는 있지만 연료 가격을 나타낸 변수는 없다.
##위에서 만든 fuel 데이터를 이용해 mpg 데이터에 price_f1(연료가격) 변수를 추가한다.
mpg <- full_join(mpg, fuel, by = "fl")

##9-2. 연료 가격 변수가 잘 추가 됐는지 확인하기 위해
##model, fl, price_fl 변수를 추출해 앞부분 5행만 출력해보시오.
mpg %>% select(model, fl, price_fl) %>% head(5)





#10. 다음에 제시된 문제를 각각 10-1, 10-2, 10-3, 10-4 로 넘버링하여 해결 코드를 R로 작성한다.

midwest <- as.data.frame(ggplot2::midwest)

##10-1. popadults는 해당 지역의 성인 인구, total은 전체 인구를 나타낸다.
##midwest 데이터에 '전체 인구 대비 미성년 인구 백분율' 변수를 추가해라.
midwest$nonage <- midwest$poptotal-midwest$popadults

midwest <- midwest %>% mutate(nonage_per=(nonage/poptotal)*100)

##10-2. 미성년 인구 백분율이 가장 높은 상위 5개 county(지역)의
##미성년 인구 백분율을 출력해라.
midwest %>% select(county,nonage_per) %>% arrange(desc(nonage_per)) %>% head(5)


##10-3. 분류표의 기준에 따라 미성년 비율 등급 변수를 추가하고, 각 등급에 몇 개의 지역이 있는지 알아보자.

midwest$nonage_grade <- ifelse(midwest$nonage_per>=40,"large", 
                               ifelse(midwest$nonage_per>=30&midwest$nonage_per<40,"middle", "small"))

midwest %>% group_by(nonage_grade) %>% summarise(county_n = n())

##10-4. popasian은 해당 지역의 아시아인 인구를 나타낸다.
##전체 인구 대비 아시아인 인구 백분율 변수를 추가하고
##하위 10개 지역의 state(주), county(지역명), 아시아인 인구 백분율을 출력하시오.
midwest$asian_per <- (midwest$popasian/midwest$poptotal)*100

midwest %>% select(state,county,asian_per) %>% arrange(asian_per) %>% head(10)




#11. 다음에 제시된 문제를 각각 11-1, 11-2 로 넘버링 하여 해결 코드를 R로 작성한다.


mpg <- as.data.frame(ggplot2::mpg)
mpg[c(65, 124, 131, 153, 212), "hwy"] <- NA

##11-1. drv(구동방식)별로 hwy(고속도로 연비) 평균이 어떻게 다른지 알아보려고 한다.
##분석을 하기 전에 우선 두 변수에 결측치가 있는지 확인해야 한다.
##drv 변수와 hwy 변수에 결측치가 몇 개 있는지 알아보시오.
is.na(mpg$hwy) 
table(is.na(mpg$hwy)) #결측치 5개
table(is.na(mpg$drv)) #결측치 없음

##11-2.filter()를 이용해 hwy 변수의 결측치를 제외하고, 어떤 구동방식의 hwy 평균이 높은지 알아보시오.
##하나의 구문으로 만들어야 한다.
mpg %>% filter(!is.na(hwy)) %>% group_by(drv) %>% summarise(mean=mean(hwy))




#12.다음에 제시된 문제를 각각 12-1, 12-2, 12-3 으로 넘버링 하여 해결 코드를 R로 작성한다.

mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k" #drv 이상치 할당
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)  #cty 이상치 할당

##12-1. drv에 이상치가 있는지 확인하시오.
##이상치를 결측 처리한 다음 이상치가 사라졌는지 확인하시오.
##결측 처리할 때는 %in%기호를 활용하시오.
table(mpg$drv)

mpg <- ifelse(mpg$drv %in% c("4","f","r"), mpg$drv,NA)

table(mpg$drv)


##12-2. 상자 그림을 이용해서 cty에 이상치가 있는지 확인하시오.
##상자 그림의 통계치를 이용해 정상 범위를 벗어난 값을 결측 처리한 후 
##다시 상자 그림을 만들어 이상치가 사라졌는지 확인하시오.

boxplot(mpg$cty)
mpg$cty <- ifelse(mpg$cty < 9 |  mpg$cty >25, NA, mpg$cty)


##12-3. 두 변수의 이상치를 결측 처리하고 분석할 차례이다.
##이상치를 제외한 다음 drv 별로 cty 평균이 어떻게 다른지 알아보시오.
##하나의 구문으로 만들어져야 한다.

mpg %>% 
  filter(!is.na(drv)&!is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean(cty))
