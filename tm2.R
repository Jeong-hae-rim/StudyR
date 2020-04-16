


tool <- readLines("book/공구.txt", encoding = 'UTF-8')


tool2 <- extractNoun(tool)
tool2

tool3 <- unlist(tool2)
tool3

tool4 <- Filter(function(x) {nchar(x) >= 2}, tool3)

tool4 <- gsub("[^가-힣]","",tool4)
tool4 <- gsub("공구", "", tool4)
tool4 <- gsub("해주", "", tool4)
tool4 <- gsub("부탁", "", tool4)
tool4 <- gsub("필요해요", "", tool4)
tool4 <- gsub("원해.*", "", tool4)
tool4 <- gsub("이요", "", tool4)

tool5 <- unlist(strsplit(tool4, split = "\\s+"))

tool5 <-Filter(function(x) {nchar(x) <= 5}, tool5)

word_tool <- table(tool5)
final_tool <- sort(word_tool, decreasing = T)

final_tool <- as.data.frame(final_tool)
View(final_tool)

windowsFonts(lett=windowsFont("휴먼옛체"))


length(final_tool$tool5)
length(final_tool$Freq)

png("wc.png", 700, 400)

wordcloud(final_tool$tool5, final_tool$Freq, family="lett",
          min.freq = 2,  
          random.order = FALSE, 
          rot.per = 0.5, scale = c(2, 1), 
          colors = rainbow(7))
dev.off()

?colors
