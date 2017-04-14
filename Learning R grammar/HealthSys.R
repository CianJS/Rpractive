## 스프레드 시트형 데이터 읽어들어 분석하는 스크립트
## tools -> from local file
?read.delim

HealthSys <- read.delim("~/Rpractive/HealthSys.txt", sep="\t", quote="",header=T, comment.char = "#",as.is=T, check.names = F)

View(HealthSys)

## .. 각 열 요약정보
summary(HealthSys)
