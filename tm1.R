

word_data4 <- readLines("book/hotel.txt")
word_data4


word_data5 <- extractNoun(word_data4)
word_data5


undata1 <- unlist(word_data5)
undata1

undata3 <- Filter(function(x) {nchar(x) >= 2}, undata1)



word_table1 <- table(undata3)
word_table1

final1 <- sort(word_table1, decreasing = T)


final3 <- head(final1, 10)

View(final3)

write.csv(final3, file='hotel_top_word.csv')
