

words_utf8 <- scan("data/memo.txt", what="",encoding="UTF-8")
words_utf8

imsi1 <- gsub("[&$!#@%<>]","",words_utf8)
imsi2 <- gsub("[1-9]","",imsi1)
imsi3 <- gsub("[RAnalysisBigData]","",imsi2)

text <- paste(imsi3, collapse = " ")

write(text, file="memo_new.txt")
