

# 문제1

grade <- sample(1:6, 1)
if(grade<=3){
  cat(grade,"학년은 저학년입니다.","\n")
}else{
  cat(grade,"학년은 고학년입니다.","\n")
}

# 문제2

choice <- sample(1:5,1)
if(choice==1){
  cat("결과값 :",300+50,"\n")
}else if(choice==2){
  cat("결과값 :",300-50,"\n")
}else if(choice==3){
  cat("결과값 :",300*50,"\n")
}else if(choice==4){
  cat("결과값 :",300/50,"\n")
}else{
  cat("결과값 :",300%/%50,"\n")
}

# 문제3

count <- sample(3:10,1)
deco <- sample(1:3,1)
if(deco==1){
 deco <- '*'
} else if (deco==2) {
  deco <- '$'
} else {
  deco <- '#'
}
for(count in 1:count){
  cat(deco)
}


# 문제4

score <- sample(0:100,1)
num<- as.character(score%/%10)
result <- switch(EXPR=num,
                '10'=,'9'="A등급",
                '8'="B등급",
                '7'="C등급",
                '6'="D등급",
                 "F등급")
cat(score,"점은 ",result,"입니다\n",sep="")

# 문제5

alpha <- paste0(c(LETTERS[1:26]), c(letters[1:26]))

