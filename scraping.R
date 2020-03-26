
install.packages("rvest")
library(rvest)

url <- "http://unico2013.dothome.co.kr/crawling/exercise_bs.html"

text <- read_html(url)
text


#<ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
 

#<h1> 태그의 컨텐츠
node1 <- html_nodes(text, "h1")
html_text(node1)

#<a> 태그의 컨텐츠와 href 속성값
node2 <- html_nodes(text, "a")
html_text(node2)
html_attr(node2, "href")

#<img> 태그의 src 속성값
node3 <- html_nodes(text, "img")
html_attr(node3, "src")

#첫 번째 <h2> 태그의 컨텐츠
node4 <- html_nodes(text, "h2:nth-of-type(1)")
html_text(node4)

#<ul> 태그의 자식 태그들 중 style 속성의 값이 green으로 끝나는 태그의 컨텐츠
node5 <- html_nodes(text, "ul>*[style$='green']") #[속성$=”값”]
node5
html_text(node5)

#두 번째 <h2> 태그의 컨텐츠
node6 <- html_nodes(text, "h2:nth-of-type(2)")
html_text(node6)

#<ul> 태그의 모든 자식 태그들의 컨텐츠 
node7 <- html_nodes(text, "ol>*")
html_text(node7, trim=TRUE)

#<table> 태그의 모든 자손 태그들의 컨텐츠 
node8 <- html_nodes(text, "table *") #자손 태그를 불러오려면 띄어쓰기 하고 * 주면 됨.
html_text(node8)

#name이라는 클래스 속성을 갖는 <tr> 태그의 컨텐츠
node9 <- html_nodes(text, "tr.name")
html_text(node9)

#target이라는 아이디 속성을 갖는 <td> 태그의 컨텐츠
node10 <- html_nodes(text, "td#target")
html_text(node10)
