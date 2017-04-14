library(readr)
keycode <- read.csv("~/Rproj/KeyCode.csv")
View(keycode)

# as.data.frame으로 List 타입인 keycode를 data.frame으로 형변환
keycode <- as.data.frame(keycode)

# na.omit <- na를 가진 모든 행 삭제
keycode <- na.omit(keycode)

# != 제외시켜라, NULL이 포함된 모든 행. 
keycode <- keycode[keycode$click != '',]

 View(keycode)

# formattable 표 작성을 위한 패키지
# https://renkun.me/formattable/
install.packages("formattable")
install.packages("rprojroot") # formattable 설치를 위해 필요한 패키지
library(formattable)

# data.frame으로 이루어진 keycode 작성
keycodes <- data.frame(
  keycode$Reference,
  keycode$click
)

# formattable 실행
formattable(keycodes)
