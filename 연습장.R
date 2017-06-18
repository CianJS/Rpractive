# ----- 데이터 읽어들이기 -----

#header=T ??? 이건 첫 줄이 열 이름이라는 뜻.
#quote=“” ??? 따옴표는 안 썼다는 뜻.
#comment.char=“#” ??? 각 줄에서 “#” 표시 이후는 그냥 무시하라는 뜻.
#as.is=T ??? 이건 열이 문자로 되어 있으면 그냥 그렇게 두라는 뜻.
#check.names=F ??? 이건 열 이름에 공란이 있거나 하더라도 그냥 그대로 두라는 뜻
#dim(GDP) ??? 몇 개의 변수에 각각 몇 개의 항목이 들어있는지 확인하는 변수
#names(GDP) ??? 데이터 내의 변수(열) 이름 확인
#colnames(HeakthSys) ??? 데이터 내의 변수(열) 이름 확인
#summary(GDP) ??? 데이터 각 변수를 요약하는 것

# ----- 데이터의 변수 -----
#HealthSys(데이터 이름)$~~~ ??? 데이터 변수 보기
#HealthSys(데이터 이름)[[~~~]] ??? 데이터 변수 보기
#max(GDP$GDPperCapita2012,na.rm = T)

# ----- 데이터의 변수의 항목 -----
#GDP$GDPperCapita2012[GDP$CountryCode == 'KOR']
#2012년의 일인당 GDP에서 CountryCode가 KOR인 녀석
#GDP$GDPperCapita2012[GDP$OECD == 'Y'] ??? OECD 국가들의 2012년 1인당 GDP 보기
#2012년 일인당 GDP가 10000이 넘는 나라
#GDP$Country[GDP$GDPperCapita2012 > 10000] -> 이럴 경우 NA가 출력되기에 그렇지 않으려면
#GDP$Country[which(GDP$GDPperCapita2012 > 10000)] -> 이렇게 하라
#GDP$Country[which(GDP$GDPperCapita2012 > GDP$GDPperCapita2012[GDP$CountryCode == 'KOR'])]
#한국보다 일인당GDP가 더 높았던 나라
#
#KORGDP <- GDP$GDPperCapita2012[GDP$CountryCode == 'KOR'] -> KORGDP라는 변수를 추가
#GDP$Country[which(GDP$GDPperCapita2012 > KORGDP)] -> 추가한 KORGDP보다 일인당 GDP가 더 높았던 나라 구하기


#n <- which(HealthSys$OECD == 'Y') <- OECD 국가만을 n 변수로 묶는다.
#HealthSysOECD <- HealthSys[n,] <- HealthSys 행에서 n에 있는 녀석들만 쓰겠다.
#dim(HealthSysOECD) <- HealthSysOECD의 행과 열의 개수
#HealthSysOECD$Country
#이렇게 하면 OECD 회원국들만 있는 데이터가 된다!

#공공부문 지출이 우리보다 적은 나라 가운데 우리나라보다 일 인 당 GDP가 큰 나라는 얼마나될까요?
#HealthSys$Country[HealthSys$PublicHealthExpensePercTotal < pubkor & GDP$GDPperCapita2012 > KORGDP]

#우리나라의 공공부문 지출은 OECD를 대상으로 했을 때 몇 번째 정도인가?
#nkoroecd <- which(HealthSysOECD$CountryCode == "KOR")
#rank(HealthSysOECD$PublicHealthExpensePercTotal)[nkoroecd]



# ----- 그림그리기 -----
#xlab="1111" <- x축 제목
#main="name" <- 메인 제목
#density=30 <- 30개의 빗금 angle의 설정이 없으면 자동45도로 설정됨.
#angle=120 <- 빗금이 120도가 된다.
#lines(density(GDP$GDPperCapita2012, na.rm=T)) <- 추체선그리기

#내장 데이터셋 살펴보기
#iris, data()

install.packages("RCurl")
install.packages("rvest")
install.packages("stringr")
install.packages("httr")
install.packages("magrittr")
install.packages("XML")

library(RCurl)
library(rvest) 
library(stringr)
library(httr)
library(magrittr)
library(XML)

url <- paste0("http://www.itworld.co.kr/t/34/%ED%81%B4%EB%9D%BC%EC%9A%B0%EB%93%9C?page=",1)
cloud <- read_html(url)
ex <- cloud %>% html_nodes(css = "h4") %>% html_nodes(css = "a")
ex

regFind <- regexpr("<a href=\".*\">", ex, perl = T)  
regmatches(ex, regFind)

# --------------------------------------------------------------------

#mean함수 없이 평균구하기
x1 <- c(1,4,2,5,7,3,9,5,3)

fn <- function(x){
  p <- 0
  for (i in 1:length(x)) {
    p <- p+x[i]
  }
  p<-p/length(x)
  return(p)
}
fn(x1)

#max, min 함수 없이 최댓값, 최솟값 구하기
fn2 <- function(x){
  ma <- x[1]
  mi <- x[1]
  for(i in 1:length(x)){
    if(ma<x[i]){
      ma <- x[i]
    }
    if(mi>x[i]){
      mi <- x[i]
    }
  }
  cnames <- c("max", "min")
  matrix(data = c(ma,mi), ncol = 2, dimnames = list(c("value"),cnames))
}

fn2(x1)

#      max min
# value   9   1

#========================
