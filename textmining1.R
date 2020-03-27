

words_utf8 <- readLines("data/memo.txt", encoding = 'UTF-8')
words_utf8

imsi1 <- gsub("[&$!#@%<>]","",words_utf8)
imsi2 <- gsub("[1-9]","",imsi1)
imsi3 <- gsub("[RAnalysisBigData]","",imsi2)

write(imsi3, file="memo_new.txt")
