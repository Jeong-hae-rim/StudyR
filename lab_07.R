

# 문제1

countEvenOdd <- function(x){
  result <- list(
    even = x%%2 != 1, 
    odd = x%%2 == 1
    )
  if(is.numeric(x)){
    return(result)
  }else{
    return()
  }
}
countEvenOdd(1)

# 문제2

vmSum <- function(x){
  if(is.vector(x)){
    if(is.numeric(x)){
      sum <- 0
      for(i in 1:length(x)){
        sum <- sum + x[i]
      }
      return(sum)
    }else{
      print("숫자벡터를 전달하숑!")
      print(0)
    }
  }else{
    print("벡터만 전달하숑!")
  }
}
vmSum(1:10);vmSum('가나다');vmSum(list)

# 문제3

vmSum2 <- function(x){
  if(is.vector(x)){
    if(is.numeric(x)){
      sum <- 0
      for(i in 1:x){
        sum <- sum + i
      }
      return(sum)
    }else{
      warning("숫자 벡터를 전달하숑!")
    }
  }else{
    stop("벡터만 전달하숑!")
  }
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
    if(any(is.na(x))){ 
      warning("NA를 최저값으로 변경하여 처리함!!")
      x <- replace(x, is.na(x), min(x,na.rm=T))
      }
  }else{
     stop("벡터만 처리 가능!")
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
