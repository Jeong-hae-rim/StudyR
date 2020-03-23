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

rownames(m3) <- c("row1","row2","row3")
colnames(m3) <- c("col1","col2","col3")