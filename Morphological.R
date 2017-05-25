install.packages("KoNLP")
install.packages("wordcloud")
require(httr)
require(XML)
# 형태소 분석할 웹 주소 a1에 저장.
a1 <- sapply(1:10, function(x) {
  paste("http://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code=153964&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page=", 
        x, sep = "")
})

# 크롤링
res <- sapply(1, function(x) {
  b <- xmlRoot(htmlTreeParse(file = a1[x], useInternalNodes = T, encoding = "UTF-8")) 
  res <- xpathSApply(doc = b, path = "//div[@class = 'score_reple']/p",xmlValue)
})

#matrix를 vector로 변환
ares <- as.vector(res)
require(KoNLP) # package loading (형태소 분석)
useSejongDic() # 세종 사전을 사용한다.
require(wordcloud) # wordcloud pakcage loading

# === 불필요한 문자 제거 ===

# . 제거
res1 <-gsub("[.]", "", res)
# ??
res1 <- gsub("[:punc:]", "", res1)
# BEST 제거
res1 <- gsub("BEST","",res1)

# 문장에서 형태소 분리
res2 <- sapply(res1, extractNoun)
# names에 NULL 초기화. 즉, 결과값에서는 문장 제거된 상태로 형태소만 출력.
names(res2) <- NULL
# list 형태 제거 - 문자들이기 때문에 character형으로 전환.
res2 <- unlist(res2)
# 사용된 단어들의 횟수 세기
res2 <- tapply(res2,res2,length)

# Plots 꾸미기
# 색상 set 지정
palete <- brewer.pal(8, "Set1")
# min.freq = (단어수), random.color - palete에서 저장한 색을 랜덤으로 부여.
wordcloud(words = names(res2), freq = res2, min.freq = 3, random.color = T, scale = c(4,0.5), ordered.colors = F, random.order = T, color = palete)
