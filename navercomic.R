

url <- "https://comic.naver.com/genre/bestChallenge.nhn"
text <- read_html(url)
text

navercomic <- NULL

#이름
node1 <- html_nodes(text, ".challengeTitle")
node1
title <- html_text(node1, trim=TRUE)
title

#요약
node2 <- html_nodes(text, ".summary")
node2
summ <- html_text(node2, trim=TRUE)
summ

#별점
node3 <- html_nodes(text, ".rating_type")
node3
imsi <- html_text(node3, trim=TRUE)
star<- gsub("[[:alpha:][:space:]]", "", imsi)
star

comics <- cbind(comicName=title,  comicSummary=summ, comicGrade=star)
navercomic2 <- rbind(navercomic, comics)

View(navercomic2)

write.csv(navercomic2, file="navercomic.csv")
