

# [ 동적 크롤링 수행평가 ]


### 웹사이트 불러내기
library(RSelenium)
remDr <- remoteDriver(remoteServerAddr = "localhost", port = 4445, browserName = "chrome")
remDr$open()
remDr$navigate("https://www.istarbucks.co.kr/store/store_map.do?disp=locale")

### 전체 매장 개수 추출
sizeCss <- "#container > div > form > fieldset > div > section > article.find_store_cont > article > article:nth-child(4) > div.loca_step3 > div.result_num_wrap > span"
size <- remDr$findElements(using='css selector', sizeCss)
limit <- sapply(size, function(x){x$getElementText()})

### 3개의 매장 정보를 읽고 세 번째 매장 DoM객체 위에서 스크롤 이벤트 발생
### (마지막 매장에 도달한 경우 더이상 스크롤이벤트 발생 불필요.)

indexlink <- NULL
reple <- NULL
index <- 1
shopname <- NULL
lat <- NULL
lng  <- NULL
shopaddr <- NULL
shopphone <- NULL
repeat{
    indexCss <- paste("#mCSB_3_container > ul > li:nth-child(",index,")", sep='')
    indexlink <- remDr$findElements(using='css selector', indexCss)
    indexlink2 <- sapply(indexlink, function (x) {x$getElementText()})
    doms <-unlist(strsplit(unlist(indexlink2),"\n"))
    
    
    shopname <- append(shopname, doms[1])
    shopaddr <- append(shopaddr, doms[2])
    shopphone <- append(shopphone, doms[3])
    
    lat <- append(lat, unlist(sapply(indexlink, function(x) {
      x$getElementAttribute("data-lat")
    })))
    
    lng <- append(lng, unlist(sapply(indexlink, function(x) {
      x$getElementAttribute("data-long")
    })))
    
    cat(length(reple), "\n")
    
  if(index %% 3 == 0 && index != limit){
    remDr$executeScript(
      "var dom = document.querySelectorAll('#mCSB_3_container > ul > li')[arguments[0]];
      dom.scrollIntoView();", list(index))
  }
  
    index <- index+1

}
df <- data.frame(매장명=shopname, 위도=lat, 경도=lng, 주소=shopaddr, 전화번호=shopphone)
View(df)

write.csv(df, file="starbucks.csv")
