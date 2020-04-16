


#크롤링 시간에 크롤링 해놓은 “yes24.txt” 파일의 내용을 읽고 명사만 뽑아내 
#많이 등장한 단어 순으로 다음과 같이 워드클라우딩 하는 R 코드를 작성하여 
#tm3.R 로 그리고 워드 클라우딩 결과는 wc.html 로 저장하여 제출하시오. 
#단, 단어의 길이가 2자~4자로 제한한다.



library(KoNLP)

w_c <- readLines("yes24.txt")

w_c2 <- extractNoun(w_c)

w_c3 <- unlist(w_c2)
w_c3


w_c4 <- Filter(function(x) {nchar(x) >= 2 & nchar(x) <=4}, w_c3)

w_c4 <- gsub("[^가-힣]","",w_c4)

w_c4 <- unlist(strsplit(w_c4, split = "\\s+"))
w_c4

table_wc <- table(w_c4)

final_wc <- sort(table_wc, decreasing = T)

View(final_wc)

library(wordcloud2)

result<-wordcloud2(data = final_wc, rotateRatio = 0, fontFamily = "휴먼옛체")

saveWidget(result,"wc.html",title="WORDCLOUD2 실습", selfcontained = F)

