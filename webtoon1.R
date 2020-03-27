


#네이버 웹툰 댓글 페이지에서 
#베스트 댓글과 전체 댓글 50페이지를 읽어서 webtoon1.txt 파일에 저장(write())하는 
#코드를 작성한다. 


#네이버 웹툰 댓글 페이지 읽어오기
library(RSelenium)
remDr<-remoteDriver(remoteServerAddr= "localhost" ,
                    port = 4445, browserName= "chrome")
remDr$open()

url<-'http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135'
remDr$navigate("http://comic.naver.com/comment/comment.nhn?titleId=570503&no=135")

#베스트 댓글 읽어오기

best <- NULL

bestReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
best <- sapply(bestReviewNodes,function(x){x$getElementText()})

best <- unlist(best)


# 전체 댓글 50페이지 읽어오기

total <- c()
temp <- vector()
num <- c(1:5)
totalReview <- remDr$findElement(using='css','#cbox_module > div > div.u_cbox_sort > div.u_cbox_sort_option > div > ul > li:nth-child(2) > a')
totalReview$clickElement()
for(num in 1:5){
     for (i in 4:13) {
                totalReviewNodes<-remDr$findElements(using ="css selector","ul.u_cbox_list span.u_cbox_contents")
                total <- sapply(totalReviewNodes,function(x){x$getElementText()})
                temp <- c(temp, total)
                next1 <- paste0("#cbox_module>div>div.u_cbox_paginate>div> a:nth-child(",i,") > span")
                next2<-remDr$findElement(using='css',next1)
                next2$clickElement()
                #print(temp)
                Sys.sleep(2)
     }
}

length(temp)


all <- append(best, temp)
all<-unlist(all)
length(all)


write(all, file="webtoon1.txt", sep = "")
