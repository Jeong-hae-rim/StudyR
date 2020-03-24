
# 문제1

L1 <-list(
  name = "scott",
  sal = 3000
)

result1 <- L1[[2]]*2

# 문제2

L2 <- list('scott', c(100,200,300))

# 문제3

L3 <- list(c(3,5,7), c("A","B","C"))

L3[[2]][1] <- 'Alpha'

# 문제4

L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))

L4[['alpha']] + 10


# 문제5

L5 <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))

mean(unlist(L5))

# 문제6

time <- 32150

L6<- list(
  시 = (time%/%3600),
  분 = ((time%/%60)%%60),
  초 = time%%60
)

paste(L6$시,"시간",L6$분,"분",L6$초,"초") #8시 55분 50초
