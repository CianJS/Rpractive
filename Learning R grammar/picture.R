##--------------------
## ������ �ҷ�����
##--------------------
ctrl <- scan("plantgrowthctrl.txt")
trt1 <- scan("plantgrowthtrt1.txt")
trt2 <- scan("plantgrowthtrt2.txt")

##--------------------
## ��� ���
##--------------------
ctrl.avg <- mean(ctrl)
trt1.avg <- mean(trt1)
trt2.avg <- mean(trt2)

##--------------------
## �߰��� ���
##--------------------
ctrl.med <- median(ctrl)
trt1.med <- median(trt1)
trt2.med <- median(trt2)

##--------------------
## ǥ������ ���
##--------------------
ctrl.sd <- sd(ctrl)
trt1.sd <- sd(trt1)
trt2.sd <- sd(trt2)

##--------------------
## �ּҰ�(Min),�ִ밪(Max), ��հ�(Mean), �߰���(Median)
## 25%(1st Qu.), 75%(3rd Qu.) ���ϱ�
##--------------------
summary(ctrl)
summary(trt1)
summary(trt2)


##--------------------
## ctrl �׸���
##--------------------

plot(ctrl, main="dopyu", ylab="kg", type="b", lty=1, ylim=c(3.5,6.5), lwd="2")
points(trt1, pch=2, type="b", lty=2, lwd="2", col=2)
points(trt2, pch=3, type="b", lty=3, lwd="2", col=3)

## ǥ�� ���� -> main="..."
## y���� ���� -> ylab="..."
## pch ���� ��� plot()���θ� �� ��� �⺻�� 1(��)�̴�.
## type="b" �� �������� �������� ������ �����ŵ�ϴ�.
## �� ������ lty�� ǥ���մϴ�!
## lty=1�� �Ǽ�, lty=2�� ������ ��
## lty=3�� �����Դϴ�
## ylim=c(y1,y2) �׸��� y�� ���� ��
## ���� �β� ex) lwd="2"
## ���� �� ���� col=2 1�� ������, 2�� ������, 3�� �ʷϻ�

##plot(ctrl, trt1, main=��Plant Yield Comparison��, xlab=��Control��, ylab=��Treatment1��, pch=21, bg=��gray��)