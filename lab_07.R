

# 문제1

countEvenOdd <- function(x){
  odd <- 0
  even <- 0
  if(is.numeric(x)){
    for(i in 1:x){
      if(x%%2 == 0){
        even = even+x
      }else{
        odd = odd+x
      }
    }
  }else{
    return()
  }
  result <- list(even=even, odd=odd)
  return(result)
}
countEvenOdd(1)



# 문제2

vmSum <- function(x){
  if(is.vector(x) && !is.list(x)){
    if(is.numeric(x)){
      sum <- 0
      for(i in 1:length(x)){
        result <- sum + x[i]
      }
    }else{
      print("숫자벡터를 전달하숑!")
      result <- 0
    }
  }else{
    result <- "벡터만 전달하숑!"
  }
  return(result)
}
vmSum(1:10);vmSum('가나다');vmSum(list)

# 문제3

vmSum2 <- function(x){
  if(is.vector(x)){
    if(is.numeric(x)){
      sum <- 0
      for(i in 1:x){
        result <- sum + i
      }
    }else{
      warning("숫자 벡터를 전달하숑!")
      result <- 0
    }
  }else{
    stop("벡터만 전달하숑!")
  }
  return(result)
}
vmSum2(10);vmSum2('가나다');vmSum2(list)


# 문제4

mySum <- function(x){
  if (is.null(x)){
    return()
  }
  if(is.vector(x)){
    oddSum <- 0
    evenSum <- 0
    minValue <- min(x,na.rm=T)
    if(any(is.na(x))){ 
      warning("NA를 최저값으로 변경하여 처리함!!")
      x <- replace(x, is.na(x), values = minValue)
      }
      for(i in 1:length(x)){
        if(i%%2 == 0){
          evenSum <- evenSum + x[i]
        }else{
          oddSum <- oddSum + x[i]
        }
      }
      result <- list(evenSum=evenSum, oddSum=oddSum)
      return(result)
  }else{
    stop("벡터만 처리 가능!")
  } 
}

mySum(c(10,NA,2,4,5,4))

# 문제5
 
myExpr <- function(fun){
  if(is.function(fun)){
    x <- sample(1:45,6)
    result <- fun(x)
    return(result)
  }else{
    stop("수행 안 할 거임!")
  }
}
myExpr(vmSum)


# 문제6

createVector1 <- function(...){
  p <- c(...)
  if(is.null(p)){
    return()
  }else if(any(is.na(p))){
    return(NA)
  }else{
    return(p)
  }
}

createVector1();createVector1(4,NA,6,7);createVector1(4,5,6,7)


# 문제7

createVector2 <- function(...){
  p <- list(...)
  if(is.null(p)){
    return()
  }else{
    num <- NULL
    char <- NULL
    log <- NULL
    for(i in 1:length(p)){
      if(is.numeric(p[[i]])){
        num <- append(num, p[[i]])
      }else if(is.character(p[[i]])){
        char <- append(char, p[[i]])
      }else if(is.logical(p[[i]])){
        log <- append(log, p[[i]])
      }
    }
    return(list(num,char,log))
  }
}

createVector2 ('가나다',1,2,3,TRUE,FALSE)
