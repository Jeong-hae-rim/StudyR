# 문제1

v9 <- seq(10, 38, by=2)
v9

m1 <-matrix(v9, nrow=3, ncol=5, byrow=TRUE)
m1

m2 <- m1+100
m2

m_max_v <- max(m1)
m_max_v

m_min_v <- min(m1)
m_min_v

row_max <- apply(m1, 1, max)
row_max

col_max <- apply (m1, 2, min)
col_max

# 문제2


n1 <- c(1,2,3)
n2 <- c(4,5,6)
n3 <- c(7,8,9)
m2 <- rbind(n1,n2,n3); m2

# 문제3

m3 <- matrix(1:9, nrow=3)
m3

# 문제4

m4 <- m3
rownames(m4) <- c("row1","row2","row3")
colnames(m4) <- c("col1","col2","col3")
m4

# 문제5 : 내가 원했던 모양이 안 나오는데 뭐지

(alpha <- letters[1:6])

matrix(alpha, nrow=2, ncol=3)


alpha2 <- rbind(alpha, c("x","y","z"))
alpha2

alpha3 <- cbind(alpha, c("s","p"))
alpha3

# 문제6

a <- array(1:24, dim=c(2,3,4))
a

a[2,,]
a[,1,]
a[,,3]
a+100
a[,,4]*100
a[,-1,]
a[2,,2]+100
a[,,1]-2
a*10