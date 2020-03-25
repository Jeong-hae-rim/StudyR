

owo <- scan("data/iotest1.txt")


owo

cat("오름차순 : ", sort(owo))
cat("내림차순 : ", sort(owo, decreasing = T))
cat("합 : ", sum(owo))
cat("평균 : ", mean(owo))
