

url <- "https://media.daum.net/ranking/popular/"
text <- read_html(url)
text

daumnews <- NULL

#뉴스 제목
node1 <- html_nodes(text, xpath="//*[@id='mArticle']/div[2]/ul[3]/li/div[2]/strong/a")
node1
title <- html_text(node2, trim=TRUE)
title

#신문사 
node2 <-  html_nodes(text, ".info_news")
node2
paper <- html_text(node2, trim=TRUE)
paper


data <- cbind(기사제목=title,신문사=paper)
daumnews2 <- rbind(daumnews, data)

View(daumnews2)

write.csv(daumnews2, file="daumnews.csv")
