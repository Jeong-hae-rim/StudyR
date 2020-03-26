
install.packages("rvest")
library(rvest)

url <- "https://movie.daum.net/moviedb/grade?movieId=131576"
text <- read_html(url)
text

#고객 평점
node1 <-  html_nodes(text, ".emph_grade")
node1
point <- html_text(node1)
point

#리뷰글
node2 <- html_nodes(text, ".desc_review")
node2
review <- html_text(node2, trim=TRUE)
review

df <- data.frame(고객평점=point, 리뷰글=review)

View(df)

write.csv(
  df,              # 파일에 저장할 데이터 프레임 또는 행렬
  file="daummovie1.csv",        # 데이터를 저장할 파일명
  row.names=TRUE  # TRUE면 행 이름을 CSV 파일에 포함하여 저장한다.
)