## �������� ��Ʈ�� ������ �о��� �м��ϴ� ��ũ��Ʈ
## tools -> from local file
?read.delim

HealthSys <- read.delim("~/Rpractive/HealthSys.txt", sep="\t", quote="",header=T, comment.char = "#",as.is=T, check.names = F)

View(HealthSys)

## .. �� �� �������
summary(HealthSys)