
# 문제1

#airquality 라는 데이터셋이 몇 개의 관측치를 가지고 있으며 어떠한 변수들을 가지고 있는지 체크하려 한다.
#이 때 사용되는 R코드를 작성하시오.

View(airquality)
str(airquality)

# 문제2

df1 <- matrix(1:10, nrow=5, ncol=2)
colnames(df1) <- c("x","y")

# 문제3

df2 <- matrix(1:10, nrow=5, ncol=2)

df2 <- cbind(df2[,1], letters[1:5], df2[,2])
colnames(df2) <- c("col1", "col2","col3")

# df2 <- data.frame(col1=1:5, col2=letters[1:5], col3=6:10) -> 이런 방식도 있음

# 문제4

제품명 <- c("사과","딸기","수박")
가격 <- c(1800,1500,3000)
판매량 <- c(24,38,13)

df3 <- data.frame(제품명, 가격, 판매량)

# 문제5

mean(df3$가격)
mean(df3$판매량)

# 문제6

name <- c("Potter", "Elsa", "Gates", "Wendy", "Ben")
gender <- factor(c("M", "F", "M", "F", "M"))
math <- c(85, 76, 99, 88, 40)

df4 <- data.frame(name, gender, math)

df4$stat <- c(76,73,95,82,35)

df4$score <- df4$math + df4$stat

df4$grade<-ifelse(df4$score >= 150,"A",
                    ifelse(df4$score >= 100 & df4$score < 150,"B", 
                           ifelse(df4$score < 100,"C","D")))


# 문제7

emp
str(emp)

# 문제8

emp[3:5,]

# 문제9

emp["ename"]

# 문제10

emp[c("ename", "sal")]

# 문제11

emp[emp$job=='SALESMAN',c("ename","job","sal")]


# 문제12

emp[emp$sal >= 1000 & emp$sal <= 3000, c("ename", "sal", "deptno")]
# 연산자 &를 하나만 줘야 행마다 계산이 일어난다.

# 문제13

emp [!emp$job=='ANALYST', c("ename", "job", "sal")]

# 문제14

emp [emp$job=='SALESMAN'|emp$job=='ANALYST', c("ename", "job")]
# 연산자 |를 하나만 줘야 행마다 계산이 일어난다.

# 문제15

emp[is.na(emp$comm), c("ename","sal")]

# 문제16

emp[order(emp$sal, decreasing = F),]
#추가 API를 설치해서 더 쉽게 소팅할 수 있음

sort(emp$sal) #월급을 적게 받는 순으로 출력할 뿐 누가 해당 월급을 받는지는 알 수 없음
order(emp$sal) #각 직원들이 받는 월급을 index로 추출해줌