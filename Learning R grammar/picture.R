##--------------------
## 데이터 불러오기
##--------------------
ctrl <- scan("plantgrowthctrl.txt")
trt1 <- scan("plantgrowthtrt1.txt")
trt2 <- scan("plantgrowthtrt2.txt")

##--------------------
## 평균 계산
##--------------------
ctrl.avg <- mean(ctrl)
trt1.avg <- mean(trt1)
trt2.avg <- mean(trt2)

##--------------------
## 중간값 계산
##--------------------
ctrl.med <- median(ctrl)
trt1.med <- median(trt1)
trt2.med <- median(trt2)

##--------------------
## 표준편차 계산
##--------------------
ctrl.sd <- sd(ctrl)
trt1.sd <- sd(trt1)
trt2.sd <- sd(trt2)

##--------------------
## 최소값(Min),최대값(Max), 평균값(Mean), 중간값(Median)
## 25%(1st Qu.), 75%(3rd Qu.) 구하기
##--------------------
summary(ctrl)
summary(trt1)
summary(trt2)


##--------------------
## ctrl 그리기
##--------------------

plot(ctrl, main="dopyu", ylab="kg", type="b", lty=1, ylim=c(3.5,6.5), lwd="2")
points(trt1, pch=2, type="b", lty=2, lwd="2", col=2)
points(trt2, pch=3, type="b", lty=3, lwd="2", col=3)

## 표의 제목 -> main="..."
## y축의 제목 -> ylab="..."
## pch 도형 모양 plot()으로만 한 경우 기본값 1(원)이다.
## type="b" 각 데이터의 도형끼리 선으로 연결시킵니다.
## 선 종류는 lty로 표현합니다!
## lty=1은 실선, lty=2는 끊어진 선
## lty=3은 점선입니다
## ylim=c(y1,y2) 그림의 y축 범위 설
## 선의 두께 ex) lwd="2"
## 선의 색 변경 col=2 1은 검은색, 2는 붉은색, 3은 초록색

##plot(ctrl, trt1, main=“Plant Yield Comparison”, xlab=“Control”, ylab=“Treatment1”, pch=21, bg=“gray”)
