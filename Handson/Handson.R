#주사위

roll <- function(){
  die <- 1:6
  dice <- sample(die, size=2, replace = TRUE, # repalce = TRUE는 복원표본추출을 한다.
  prob = c(1/8, 1/8, 1/8, 1/8, 1/8, 3/8))
  sum(dice)
}
roll()

library(ggplot2)

rolls <- replicate(10000, roll())
qplot(rolls, binwidth = 1)

#카드게임

names(die) <- c("one", "two", "three", "four", "five", "six")
die
names(die) <- NULL #이름 속성 제거

hand1 <- c("ace", "king", "queen", "jack", "ten", "spades",
           "spades", "spades", "spades", "spades")

matrix(hand1, nrow = 5)
matrix(hand1, ncol = 2)
dim(hand1) <- c(5, 2)
hand1

hand2 <- c("ace", "spades", "king", "spades", "queen", "spades", "jack", "spades",
           "ten", "spades")

matrix(hand2, nrow = 5, byrow = TRUE)
matrix(hand2, ncol = 2, byrow = TRUE)

Sys.time() #현재 시각을 알려줌.

#요인(FACTOR)
gender <- factor(c("male", "female", "female", "male"))
unclass(gender)
as.character(gender) #factor을 문자열로 전환

card <- c("ace", "hearts", 1)
card

# 데이터 불러오기
deck <- read.csv(file = "~/Rproj/deck.csv")
head(deck, 10)

write.csv(deck, file = "cards.csv", row.names = FALSE)

getwd()

# R 표기법
# 1.양의 정수
deal(deck)
new <- deck[c(1,1,1),c(1,2,3)]
deck[1:2, 1, drop = FALSE]

# 2. 음의 정수
deck[-1, 1:3] # 첫 행 제외 나머지
deck[-(2:52), 1:3] # 첫행만

# 3. 빈칸
deck[1, ] # 1행의 전체 열가져오기
deck[ , 1:3] #모든 행의 1:3열 가져오기

# 4, 논리형 변수
deck[1, c(T, T, F)]
deck[T, ]

# 5. 이름
deck[1, c("face", "suit", "value")]

# 카드 나눠 주기

#데이터 프레임의 첫 행을 돌려주는 코드 작성
deal <- function(cards){
  cards[1, ]
}
deal(deck)

deck[c(2, 1, 3:52), ]

random <- sample(1:52, size = 52)
deck[random, ]

shuffle <- function(cards){
  random <- sample(1:52, size = 52)
  cards[random, ]
}
deck2 <- shuffle(deck)
deal(deck2)

# 달러 기호와 이중 괄호
deck$value
mean(deck$value)
median(deck$value)

lst <- list(numbers = c(1, 2), logical = TRUE, strings = c("a", "b", "c"))
lst

sum(lst[1])
sum(lst$numbers)

# Tip) $와 같은 기능을 가진 표기법(원소들의 이름이 없는 경우 사용) [[]] <- 이중 괄호

sum(lst[[1]])

# 데이터 수정하기
#1.값 변경하기
vec <- c(0, 0, 0, 0, 0, 0)
vec[1] <- 1000
vec[7] <- 0
vec

deck2$new <- 1:52 # 데이터 세트에 새 변수 추가
deck2$new <- NULL # data.frame의 열에 NULL을 추가하면 열 자체를 지우는 것이 가능
deck2$value[c(13,26,39,52)] <- 14

sum(deck2$face == "ace") # deck2에서 ace의 개수
deck2$value[deck2$face == "ace"] <- 14
deck2[deck2$face == "ace", ]

#하트게임(하트 카드와 스페이드의 퀸을 제외한 모든 카드가 0의 값이다.)
deck3 <- deck
deck3$value <- 0

#하트 카드를 찾아서 1의 값 저장하기
deck3$value[deck3$suit == "hearts"] <- 1

#스페이드퀸을 찾아 13의 값 저장하기
deck3[deck3$face == "queen" & deck3$suit == "spades", ][3] <- 13

#논리테스트 문제
#1. w는 양수인가? w > 0
w <- c(-1, 0, 1)
#2. x는 10보다 크고 20보다 작은가? 10 < x & x < 20
x <- c(5, 15)
#3. y 객체는 단어 February를 말하나? y == "February"
y <- "February"
#4. z에서 모든 값은 요일을 말하나? all(z %in% c("Monday", "Tuesday", "Wednesday", "Thursday",
# "Friday", "Saturday", "Sunday"))
z <- c("Monday", "Tuesday", "Friday")

#블랙잭(킹,귄,잭 = 10점, 각 에이스는 11 or 1)
deck4 <- deck
facecard <- deck4$face %in% c("king", "queen", "jack")
deck4[facecard, ]
deck4$value[facecard] <- 10

#에이스의 경우 받은 카드의 합이 21이 안될 경우에만 11이다.
deck4$value[deck4$face == "ace"] <- NA

#---------------------------
deal <- function(){
  card <- deck[1, ]
  assign("deck", deck[-1, ], envir = globalenv())
  card
}

shuffle <- function(){
  random <- sample(1:52, size = 52)
  assign("deck", deck[random, ], envir = globalenv())
}
#---------------------------
# setup 함수를 실행할 때 R은 객체들을 저장할 런타임 환경을 생성한다.
setup <- function(deck){
  DECK <- deck
  
  DEAL <- function(){
    card <- deck[1, ]
    assign("deck", deck[-1, ], envir = parent.env(environment()))
    card
  }
  
  SHUFFLE <- function(){
    random <- sample(1:52, size = 52)
    assign("deck", DECK[random, ], envir = parent.env(environment()))
  }
  
  list(deal = DEAL, shuffle = SHUFFLE)
}

#클로저(closure)
cards <- setup(deck)
deal <- cards$deal
shuffle <- cards$shuffle
# 여기서 이들(deal, shuffle)의 근원환경은 setup을 실행할 때 만들어지는 런타임 환경이다.
#Tip> 함수를 실행할 때 R은 명령을 수행할 새로운 환경(runtime environment)을 만든다.

#슬롯머신만들기
# 세 가지 심벌 랜덤 뽑기, 심벌에 따른 점수 계산.

get_symbols <- function(){
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
  sample(wheel, size = 3, replace = TRUE,
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52))
}

# if 문
#'만약 이것(this)가 참이면 저것(that)을 하라'를 R로 말한다면?'

if (this) {
  that
}
# ↑ 이렇게 표시할 수 있다.
# this는 TRUE, FALSE로 계산되는 논리 테스트거나 R 표현식이어야 한다.
# this가 TRUE라면 that을 실행한다.

# if문을 이용해 num 객체가 항상 양수가 되도록 하게 할 수 있다.
num <- -2

if(num < 0){
  num <- num*-1
}
num

# 실수를 가장 가까운 정수로 반올림.

a <- 3.14

dec <- a - trunc(a) #trunc는 숫자를 취해서 소수점 이하를 제외한 나머지(즉, 정수)를 돌려준다.
dec

if(dec>=0.5){
  a <- trunc(a)+1
} else {
  a <- trunc(a)
}
#if문 조건 두개가 필요할경우
a <- 1
b <- 1
if(a>b){
  print("a wins")
} else if (a<b){
  print("b wins")
} else {
  print("tie")
}

