#============== for() or while() ==============#
# x 1:10, y = 10 + 5*x
for(x in 1:10){
  y=10+5*x
  print(y)
}
# 1~10까지 누적합 구하기 (cummulative sum by for) : for (var in seq) { expression }
y<-0
for(i in 1:10){
  y=y+i
  cat("cummulative summation from 0 to ", i, " is ", y, "\n", sep="")
}
# 1~10까지 누적합 구하기 (cummlative sum by while) : while(condition) { expression }
z<-0
i<-1
while(i<=10){
  z=z+i
  cat("cummulative summation from 0 to ", i, " is ", z, "\n", sep="")
  i=i+1
}
# while(condition) => stop
i<-1
while(i<=5){
  i<-i+3
}
i
# while(TRUE/FALSE) { if () break } => stop
j <- 1
while(TRUE) {
 j <- j+3
 if (j > 5) break
}
j
# repeat { if () break } => stop
k<-1
repeat{
  k<-k+3
  if(k>5) break
}
k
#factorial(i) used to i > 1,000,000,000,000 stop
i<-1
repeat{
  factorial_value <- factorial(i)
  cat("factorial(", i, ") = ", factorial_value, "\n",sep="")
  if (factorial_value > 1000000000000) break
  i <- i+1
}
#factorial(i) used to 0이 100개붙은 값보다 >면 stop
i<-1
repeat{
  factorial_value <- factorial(i)
  cat("factorial(", i, ") = ", factorial_value, "\n",sep="")
  if (factorial_value > 1e+100) break
  i <- i+1
}
#============== if() ==============#
## 하나의 논리값에 대한 판단
x1<-c(4)
if (x1 %% 2 == 0) {
   y1 = c("Even Number")
   print(y1)
} else {
   y1 = c("Odd Number")
   print(y1)
}

x2<-c(5)
if (x2 %% 2 == 0) {
  y1 = c("Even Number")
  print(y1)
} else {
  y1 = c("Odd Number")
  print(y1)
}

## vector 에 대한 판단
# 홀수/짝수 여부 판단 : ifelse( condition, expression 1, expression 2 )
x <- c(1,2,3,4,5)
y <- ifelse(x%%2 == 0,"Even Number","Odd Number")
xy <- data.frame(x,y)
xy

# 양수, 0, 음수인지 여부 판단 : ifelse( condition, expression 1, expression 2 )
x <- c(-2,-1,0,1,2)
y <- ifelse(x > 0, "Positive",
      ifelse(x == 0, "Zero","Negative"))
xy <- data.frame(x,y)
xy


#============== 사용자 정의 함수 ==============#
#function_name <- function( arg1, arg2, ... ) {
#  expression - 표현식
#  return( object)}

# 평균, 표준편차, min, max 계산  ex)
stat_funtion <- function(x){
  xmean = mean(x)
  xsd = sd(x)
  xmin = min(x)
  xmax = max(x)
  xsummary = list(xmean=xmean,xsd=xsd,xmin=xmin,xmax=xmax)
  return(xsummary)
}

stat_funtion(x=HealthSys$PublicHealthExpensePercTotal)

#"target of assignment expands to non-language object" error 고치기
x<-c(1:30)
y<-c(1:5)
xy<-data.frame(x,y)
str(xy)
xy

for (i in 1:5) {
  assign(paste("xy_", i, sep=""), subset(xy, subset = (y == i)))
}
xy_1
xy_5

#list cleaning 하기 -> rm(list=ls())

#1나오는 곳 찾기,k=1이 몇번 연속으로 나오는지를 선택함.
findruns <- function(x,k){
  n <- length(x)
  runs <- NULL
  for(i in 1:(n-k+1)){
    if(all(x[i:(i+k-1)]==1)) runs<-c(runs,i)
  }
  return(runs)
}
y<-c(1,0,0,1,1,1,0,1,1)
findruns(y,1)
-------------------------------------------------------

y[-1]-y[-length(y)]#==diff(y)

a<-c(1:6)
b<-rep(c(1,2),3) #c()안의 문자열 반복시키는 명령어 rep

findud<-function(v){
  vud <- diff(v)
  return(ifelse(v>0,1,-1))
}

udc<-function(x,y){
  mean(sign(diff(x))==sign(diff(y)))
}
udc(a,b)
