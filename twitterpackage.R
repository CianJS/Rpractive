install.packages("ROAuth")
install.packages("twitteR")

library(WriteXLS)
library(base64enc)
library(RCurl)
library(ROAuth)
library(httr) 
library(twitteR) 
library(gdata)
library(KoNLP)

cainfo <- system.file("CurlSSL", "cacert.pem", package="RCurl")

cred <- OAuthFactory$new(consumerKey="q9RGuhU88Vr2zjXotTClqfDEq",
                         consumerSecret="PBrdBF0Ry7mZnpGJ6GKbmBcDM3E0E8LdnTJPvNPjSDC4TQRzp9",
                         requestURL="https://api.twitter.com/oauth/request_token",
                         accessURL="https://api.twitter.com/oauth/access_token",
                         authURL="https://api.twitter.com/oauth/authorize")

cred$handshake(cainfo=cainfo)

#save(cred, file="twitteR_credentials")

#load("twitteR_credentials")

registerTwitterOAuth(cred)

z <- getCurRateLimitInfo(cainfo=cainfo)
z$getRemainingHits()

opqster23 <- getUser("opqster23",cainfo=cainfo) 
