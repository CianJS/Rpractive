set.seed(1004)   # seed라는 난수기준표를 기준으로 난수표 1004번을 선택한것이다.

stem(rnorm(100)) # 줄기잎그림
                 # rnorm은 정규분포를 이루는 난수를 생성하는 함수이다.
                 # rnorm(100)은 정규분포를 이루는 랜덤한 숫자 100개를 생성함을 의미.
ls()
rm(list=ls())

n <- c(1:10)
sample(n,7)

m<-sample(n,100,replace = T,prob = c(1:5,rep(10,5)))
t<-table(m) #테이블로 빈도수 확인하기
prop.table(t) #테이블결과를 넣어서 백분율로 확인하

head(airquality)
names(airquality)<-tolower(names(airquality))
names(airquality)<-toupper(names(airquality))

#===============================================================
install.packages("rgl")
library("rgl")

x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)

plot3d(x,y,z,col=rainbow(1000))#c("red","blue","orange"))

#===============================================================
data.frame(cars)

data <- cars$speed
mean(cars$speed)
data<15.4

mean(data<15.4) ## 여기서 값이 0.52가 나오는데 이는 평균속도에 못미치는 차량이 52%라는것.

Indometh #데이터셋

table(Indometh$Subject==1)

mean(Indometh$Subject==1) #Subject code 가 1인것은 66개중 11개로써 상대도수는 16.67% 임을 알 수 있습니다.

#=====================================================

c <- c(20:30)

n <- function(x){
  F <- NULL
  for(i in 1:length(x)){
      F[[i]] <- 9/5*c+32
  return(F)
  }
}
n(c)

# ======== 정규분포의 확률밀도함수(pdf) ========

N.F <- function(x,mu,sigma){
  exp(-(x-mu)^2/{2*sigma^2})/sqrt(2*pi*sigma^2)
}
N.F(1,2,3)
dnorm(1,2,3)

dist(n)

# ======== which() ========

# S가 몇번째에 있는 문자열인가?를 물어봤을 때 아래 함수를 쓰면
which(LETTERS =="S") # [1] 19  <- 이렇게 19번째다.. 하고 나온다.

dicedata <- data.frame(obs=1:100,dice=round(runif(100,1,6)))
attach(dicedata)
dice

which(dice%%2==0) #이렇게 짝수인 데이터만 뽑아주고,

dicedata[which(dice%%2==0),] #dicedata의 행에다가 넣어주면 dicedata에서 짝수인 데이터들 만을 뽑아주게됩니다.

# ======== 저(고)수준 그래픽 함수 ========

#points() 함수를 쓸 때 아무런 밑준비없이 points()함수를 쓰게 된다면, 에러가 날 것이다.
#그런 points()함수를 쓰기 위해서는 plot()함수로 먼저 그림을 그린 뒤에
#points()함수를 써야 한다.

#그런 plot() 함수는 고수준 그래픽 함수라하고,
#plot()으로 먼저 그린 뒤에 사용할 수 있는 points()가 저수준 그래픽 함수가 된다.

plot(cars,pch=20,col="red")
points(c(12,23),c(100,117),pch=3,col="blue")

# ======== sor(), order(), rank() ========

a <- c(86,94,32,64,52,88,100,72)
sort(a) #내림차순:decreasing=T
order(a)#오름차순 순서로 정렬하기 위한 데이터의 정렬 색인 순서를 확인
rank(a)

#정렬이 안되어 있는가?의 확인 여부
is.unsorted()

b <- c(1:10)
c <- c(1000,1:3,100)
is.unsorted(b)
#is.unsorted()함수는 기본적으로 오름차순으로 정렬이 되어있는지를 확인한다.
d <- c(200:100)
is.unsorted(d)

#예제

swiss[1:3]
dim(swiss) #변수6개 데이터 47개를 의미
d <- swiss[1:3]

#내장 데이터셋인 swiss를 불러와 obs를 3번째까지만 출력.
swiss[1:3,]
#obs를 세번째것을 첫번째로 첫은 둘로 둘은 세번째로 이동시키기 위한 방법
swiss[c(2,3,1),] #인덱싱할 순서를 입력

order(d[1])

d[order(d[1]),]

#----------- 정렬 기준이 2개 이상인 경우 -----------

## Fertility가 반올림되어있는 상태이고.
d$Fertility <- round(d$Fertility)
head(d)
## Fertility을 기준으로 오름차순.
d[order(d[1]),]

#다중정렬 방법은 order() 함수에 우선순위 순서 별로 인자에 변수에 해당되는 
#value 를 넣어주면 됩니다

d[order(d[1],d[2]),]

