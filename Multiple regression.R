
#===================== ����ȸ�ͺм� ==============================

#A. F-test
#F-test�� ȸ�ͺм� �� ��ü�� ���� �̰��� ��������� �ǹ̰� �ִ����� �����ϱ� ���� ����ϸ�,
#ȸ�ͺм� �𵨿��� F-Statistic�� p-value�� ���� 0.05���� ���� ��� ȸ�ͽ� ��ü�� �����ϴٰ� �� �� �ִ�.
#B. p-value
#������ p-value�� �� ������ ��� ������ �����ϰ� ������ ��ġ�� ���� Ȯ���ϱ� ���� ����Ѵ�.
#���� 0.05���� ���� ��� �� ������ �����ϰ� ��� ������ �����Ѵٰ� �� �� �ִ�.
#C. adjusted-r ����
#���� ��� ������ ��%�� �����ϴ��� Ȯ���Ѵ�.

install.packages("ggplot2")
library(ggplot2)

require(datasets); require(ggplot2)
data(swiss)
str(swiss)
summary(swiss)

hist(swiss$Infant.Mortality)
qqnorm(swiss$Infant.Mortality)
qqline(swiss$Infant.Mortality)

# lm(��󺯼�~��������1+��������2, data= ����� �����ͼ� ��)

model<-lm(Infant.Mortality~. ,data=swiss)
summary(model)

#Fertility ������ ������ �ٸ� �������� ��� �������� �� ���� ��������� 
#�޶��������� Ȯ���ϱ� ���� Partial F-test�� �غ���.
model_simple <- lm(Infant.Mortality~Fertility, data=swiss)
anova(model_simple)

#ȸ�� �м��� �߿��� ���� �� �ϳ��� ���ο� ������ �־����� �� ��� ������ �����ϴ� ���̴�.
new_Fertility<-rnorm(10, mean=mean(swiss$Fertility), sd=sd(swiss$Fertility))
new_Fertility<-as.data.frame(new_Fertility)
colnames(new_Fertility)<-c("Fertility")
predict(model_simple, new_Fertility, interval="prediction")


#=====================���߰����� ���� (Multicollinearity)==============================
#ȸ�� ���� ���� ������ ���̿� ������谡 �ִ� ���.
#R������ vif �Լ��� ����� VIF���� ������ ���� �� ������,
#���� VIF ���� 4�� ������ ���߰������� �����Ѵٰ� ����.

require(car)
vif(model)
#---------------���(result)-------------------
#Fertility Agriculture Examination   Education    Catholic 
#2.855428    2.606925    3.754457    4.253857    2.349161
