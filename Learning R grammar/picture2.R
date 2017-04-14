#----------------- HIST(히스토그램) -----------------#

HealthSys <- read.delim("~/Rpractive/HealthSys.txt", comment.char="#")
View(HealthSys)

GDP <- read.delim("~/Rpractive/GDP.txt")
View(GDP)

hist(GDP$GDPperCapita2012, xlab="US $ (2012)", main="GDP / Capita",br=25,col="darkorange",density = 30)#br=구간을 나누어준다.

hist(HealthSys$PublicHealthExpensePercTotal, xlab="% of Total", main="Public Health Expense",br=25, col="purple",density = 30,angle=120)
# http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf R 색깔 지정

hist(GDP$GDPperCapita2012, xlab="US $ (2012)", main="GDP / Capita",br=25,col="darkorange",density = 30, freq=F)
#freq=F -> y축을 밀도를 나타냄 freq=T이면 빈도
lines(density(GDP$GDPperCapita2012, na.rm=T),lwd=2) #추세선그리기,lwd 선 굵게

hist(HealthSys$PublicHealthExpensePercTotal, xlab="% of Total", main="Public Health Expense",br=25, col="darkorange",freq=F)
lines(density(HealthSys$PublicHealthExpensePercTotal,na.rm=T),col="purple",lwd=2,lty=2)#lty 선모양

kor <- which(GDP$CountryCode =="KOR")
hist(GDP$GDPperCapita2012,xlab = "US $ (2012)",main = "GDP / Capita", br=25,density = 30,freq=F)
abline(v=GDP$GDPperCapita2012[kor],col="red")
#abline(..) 함수는 원래 y = a + b * x 직선을 그리라는 뜻이다.
#abline(v=..)이면 수직선, abline(h=..)이렇게 하면 수평선이 그려진다.

hist(HealthSys$PublicHealthExpensePercTotal,xlab="% of Total", main="Public Health Expese", br=25, col = "Orange" ,density = 30, freq=F)
abline(v=HealthSys$PublicHealthExpensePercTotal[kor], col="Yellow")

#----------------- BOXPLOT(박스그림) -----------------#
#2012년 일인당GDP를 OECD와 OTHER 두 개로 나누어 비교

gdp.oecd <- GDP$GDPperCapita2012[GDP$OECD =="Y"]
gdp.other <- GDP$GDPperCapita2012[GDP$OECD !="Y"]
boxplot(list(gdp.oecd,gdp.other)) ## boxplot(..)은 항상 list(..)를 받습니다!

#각 박스에 이름 넣기
gdplist <- list("OECD"=gdp.oecd,"OTHER"=gdp.other)
boxplot(gdplist)

#x축, y축, main에 제목을 넣을 때는 boxplot함수 안에서 작업을 해야한다.
boxplot(gdplist, main="GDP / Capita", xlab="Country Group", ylab="US $ (2012)")

#심볼모양(pch), 크기(cex), 색(bg) 조절하기
boxplot(gdplist, main="GDP / Capita", xlab="Country Group", ylab="US $ (2012)", pch=17, cex=1.5, bg="darkblue", col="beige")

#그림 수직에서 수평으로 바꾸기(horizontal=T)
boxplot(gdplist, main="GDP / Capita", ylab="Country Group", xlab="US $ (2012)", pch=17, cex=1.5, bg="darkblue", col="beige", horizontal=T)

#그럼 이 그림에서 한국은??
boxplot(gdplist, main="GDP / Capita", xlab="Group", ylab="US $ (2012)", pch=17, cex=1.5, bg="darkblue", col="beige")
abline(h=GDP$GDPperCapita2012[kor], col="red", lty=2)

#----------------- PLOT(산포도 복습.picture.R에 1버전이 있습니다.) -----------------#
plot(GDP$GDPperCapita2012, HealthSys$PublicHealthExpensePercTotal)

plot(GDP$GDPperCapita2012, HealthSys$PublicHealthExpensePercTotal, main="GDP vs Public Health
Portion", xlab="GDP / Capita (US $, 2012)", ylab="Public
Health Portion (%)", pch=21, bg="darkblue", col="lightblue")

#한국의 위치 표시해보기
plot(GDP$GDPperCapita2012, HealthSys$PublicHealthExpensePercTotal, main="GDP vs Public Health
Portion", xlab="GDP / Capita (US $, 2012)", ylab="Public
Health Portion (%)", pch=21, bg="darkblue", col="lightblue")

points(GDP$GDPperCapita2012[kor], HealthSys$PublicHealthExpensePercTotal[kor], pch=21, bg="darkorange", col="Yellow")
abline(v=GDP$GDPperCapita2012[kor], col="orange", lty=2)
abline(h=HealthSys$PublicHealthExpensePercTotal[kor], col="orange", lty=2)

#OECD 국가 표시
oecd <- which(GDP$OECD == "Y")
points(GDP$GDPperCapita2012[oecd], HealthSys$PublicHealthExpensePercTotal[oecd], pch=21, bg="darkred", col="pink")

#범례 표시 (/legend(<위치>, legend=<범례의 설명문>, <기타 그림 관련 입력 변수>)/)
legend("bottomright", legend=c("OECD", "Korea"),
pch=c(21,8), col=c("pink", "yellow"), pt.bg=c("darkred", "darkorange"),bg="blue")

#<위치> Ex = "topleft"
#범례 설명은 c(..)함수를 이용한다. c()함수는 여러 값을 묶어 벡터값을 만들어주는 함수다.
#bg="blue"를 사용하면 범례의 백그라운드를 지정하기 때문에
#pt.bg를 사용해야 심벌의 안쪽 색이 변한다.

#마지막 정리!
#plot()으로 밑바탕 그림 그리고, 그위에 선이나 심볼 덧씌워그리기
#lines()는 선을 덧씌우는 함수
#points()는 심볼을 덧씌운다.
#abline()는 수직 수평선 그리기
#legend()함수로 범례를 그리고 마무리