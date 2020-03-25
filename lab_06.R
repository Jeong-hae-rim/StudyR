

# 문제1

exam1 <- function(){
  letter <- paste0(LETTERS,letters,sep="")
  return(letter)
}
exam1()

# 문제2

exam2 <- function(a){
  a<-c(10)
  sum<-1
  for(i in 1:a){
    sum <- sum+i
  }
  return(sum)
}
exam2(sum)

# 문제3

exam3 <- function(b,c){
  if(b>c){
    result<-b
  }else if(c>b){
    result<-c
  }else if(c==b){
    result<-0
  }
  return(result)
}
exam3(10,10)



# 문제4

exam4 <-function(d,e,f){
  result <- 0
  if(is.numeric(d)&is.numeric(f)){
    if(e =='+'){
      result <- d+f
    }else if(e =='-'){
      result <- d-f
    }else if(e=='%/%'){
      result <- d%/%f
      if(d==0){
        result <- "오류1"
      }else if(f==0){
        result <- "오류2"
      }
    }else if(e =='%%'){
      result <- d%%f
      if(d==0){
        result <- "오류1"
      }else if(f==0){
        result <- "오류2"
      }
    }else if(!e){
    result <- "규격의 연산자만 리턴하세요"
  }
  return(result)
  }
}
exam4(1,'%/%',0)


# 문제5

exam5 <- function(g,h='#'){ 
  if(g>=1){
    for(i in 1:g){
      cat(result<-h)
    }
  }else if(g<0){
    cat(result<-"")
  }
}
exam5(g=-5,h="$")


# 문제6

exam6 <- function(x){
  if(x>=85&x<=100){
    grade<-'상'
    print(paste0(x,"점은 ",grade,"등급입니다."))
  }else if(x>=70&x<=84){
    grade<-'중'
    print(paste0(x,"점은 ",grade,"등급입니다."))
  }else if(x<=69){
    grade<-'하'
    print(paste0(x,"점은 ",grade,"등급입니다."))
  }else{
    print("NA는 처리불가")
  }
}
exam6(85)

