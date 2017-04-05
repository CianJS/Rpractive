
#===================== 다중회귀분석 ==============================

#A. F-test
#F-test는 회귀분석 모델 전체에 대해 이것이 통계적으로 의미가 있는지를 결정하기 위해 사용하며,
#회귀분석 모델에서 F-Statistic의 p-value의 값이 0.05보다 작은 경우 회귀식 전체는 유의하다고 볼 수 있다.
#B. p-value
#변수의 p-value는 각 변수가 대상 변수에 유의하게 영향을 미치는 지를 확인하기 위해 사용한다.
#역시 0.05보다 작은 경우 각 변수는 유의하게 결과 변수를 설명한다고 볼 수 있다.
#C. adjusted-r 제곱
#모델이 대상 변수의 몇%를 설명하는지 확인한다.

install.packages("ggplot2")
library(ggplot2)

require(datasets); require(ggplot2)
data(swiss)
str(swiss)
summary(swiss)

hist(swiss$Infant.Mortality)
qqnorm(swiss$Infant.Mortality)
qqline(swiss$Infant.Mortality)

# lm(대상변수~설명변수1+설명변수2, data= 사용할 데이터셋 명)

model<-lm(Infant.Mortality~. ,data=swiss)
summary(model)

#Fertility 변수를 제외한 다른 변수들을 모두 삭제했을 때 모델이 통계적으로 
#달라지는지를 확인하기 위해 Partial F-test를 해보자.
model_simple <- lm(Infant.Mortality~Fertility, data=swiss)
anova(model_simple)

#회귀 분석의 중요한 목적 중 하나는 새로운 변수가 주어졌을 때 결과 변수를 예측하는 것이다.
new_Fertility<-rnorm(10, mean=mean(swiss$Fertility), sd=sd(swiss$Fertility))
new_Fertility<-as.data.frame(new_Fertility)
colnames(new_Fertility)<-c("Fertility")
predict(model_simple, new_Fertility, interval="prediction")


#=====================다중공선성 문제 (Multicollinearity)==============================
#회귀 모델의 설명 변수들 사이에 상관관계가 있는 경우.
#R에서는 vif 함수를 사용해 VIF값을 간단히 구할 수 있으며,
#보통 VIF 값이 4가 넘으면 다중공선성이 존재한다고 본다.

require(car)
vif(model)
#---------------결과(result)-------------------
#Fertility Agriculture Examination   Education    Catholic 
#2.855428    2.606925    3.754457    4.253857    2.349161

