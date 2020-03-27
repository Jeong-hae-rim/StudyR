


url <- "http://www.saramin.co.kr/zf_user/search?search_area=main&search_done=y&search_optional_item=n&searchType=default_mysearch&searchword=Java"
text <- read_html(url)
text

#첫 번째 열은 기술이름(tech_name), 두 번째 열을 채용 정보 건수(info_count)로 구성한다


saramin <- NULL


#채용정보 건수
info <- NULL
info1 <- html_nodes(text, xpath="//*[@id='async_sfilter']/div/div[2]/div[2]/ul/li/label/span[2]")
info1
info2 <- html_text(info1, trim=TRUE)
info3 <- gsub("[[:punct:]]", "", info2)


#기술 이름
tech <- NULL
tech1 <- html_nodes(text, xpath="//*[@id='async_sfilter']/div/div[2]/div[2]/ul/li/label/span[1]")
#//*[@id="async_sfilter"]/div/div[2]/div[2]/ul/li[1]/label/span[1]
tech1
tech2 <- html_text(tech1, trim=TRUE)
tech2
tech3 <- gsub("[[:punct:]]", "", tech2)
tech3 <- tech3[-31]


saramin <- cbind(기술이름=tech3, 채용건수=info3)

View(saramin)

write.csv(saramin, file="saramin.csv")
