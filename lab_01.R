# 문제1

v1 <- c(1:10)

v2 <- v1*2

max_v <- max(v2)

min_v <- min(v2)

avg_v <- mean(v2)

sum_v <- sum(v2)

v3 <- v2[-5]

v1;v2;v3;max_v;min_v;avg_v;sum_v


# 문제2

v4 <- seq(1, 10, by=2) 

v5 <- rep(1, 5)

v6 <- rep(1:3, time=3)

v7 <- rep(1:4, each=2)

v4;v5;v6;v7


# 문제3

num <-  sample(1:100, 10)
num

sort(num)
sort(num, decreasing=T)

num[num>50]
num[num<=50]

num[which.max(num)]
num[which.min(num)]

# 문제4

v8 <- seq(1, 10, by=3)
v8
char.enname <- c("A","B","c","D")

paste(char.enname, v8, sep = ":")


# 문제5

score <- sample(1:20, 5)
myFriend <- c("둘리", "또치", "도우너", "희동", "듀크")

paste(score, myFriend, sep = "-")

myFriend[which.max(score)]

myFriend[which.min(score)]

myFriend[which(score>10)]