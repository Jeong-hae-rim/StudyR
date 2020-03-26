
#이번에는 평점과 리뷰글을 20페이지까지 스크래핑하여 데이터프레임으로 만들어 "daummovie2.csv" 로 저장한다.
#R 코드는 movie2.R 로 생성하여 csv 파일과 함께 제출하세요.



site<- "https://movie.daum.net/moviedb/grade?movieId=127122&type=netizen&page="
text <- NULL
movie.review2 <- NULL
for(i in 1: 20) {
  url <- paste(site, i, sep="")
  text <- read_html(url)
  nodes <- html_nodes(text, ".emph_grade")
  point <- html_text(nodes)
  nodes <- html_nodes(text, ".desc_review")
  imsi <- html_text(nodes, trim=TRUE)
  review <- imsi[nchar(imsi) > 0] 
  page <- cbind(평점=point,리뷰=review)
  movie.review2 <- rbind(movie.review2, page)
}

View(movie.review2)

write.csv(movie.review2, "daummovie2.csv")

