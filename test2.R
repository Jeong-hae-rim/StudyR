
owo <- scan("data/iotest2.txt", what="",encoding="UTF-8")

owo <- table(factor(owo))

owo<-data.frame(owo)


result <- as.character(owo$Var1[which.max(owo$Freq)])

cat("가장 많이 등장한 단어는 ", result,"입니다.")
