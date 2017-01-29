12+8
12-64
(12-64)*7
x=32
x+8

bucky <- tuna <- 20
bucky
tuna

assign("ham",71)
ham+20
rm(ham)
ham+20
#Error: object 'ham' not found

tuna <- as.Date("2016-01-05")
ham <- ("2016-01-05")
class(tuna)
class(ham)

a <- 32
b <- "bucky"
class(a) #numeric
class(b) #character

name <- "Bucky_Roberts"
nchar(name)

#CODING - Ctrl+R

5==7
12!=14
45<87
7<=7
"bucky"=="bucky"
"bucky"=="ham"

b1 <- c(1,2,3,4,5)

b2 <- c("bucky","hoss","emma")
b1
b2
b1*2

slammer <- 1:5
slammer
bacon <- -3:12
bacon
length(slammer)

a <- 1:5
b <- 1:3
a+b
c <- 1:10
c<5

a <- -1:10
any(a<5)
all(a<5)
hoss <- 50:60
hoss
hoss[3]
hoss[1:5]

id <- 1:4
age <- c(18,13,66,65)
name <- c("bucky","tom","merry","eric")
x <- data.frame(id,age,name)
x
nrow(x)
ncol(x)
dim(x)
names(x)[2]

x <- data.frame(id,age,name)
x
x$age
x[2]
x[2,2]
x[3,1:3]
class(x["age"])
class(x[,"age"])

#matrix
one <- matrix(1:100,nrow = 10)
one
two <- matrix(51:60,nrow = 2)
three <- matrix(61:70,nrow = 2)
two
three
dim(one)
dim(two)
dim(three)

#csv
myData <- read.csv("WorldPhones.csv",TRUE,",")
head(myData)
tail(myData)
hist(myData$Asia,main = "Asia of Phones",ylab = "grid",xlab = "data")
plot(myData$Asia,myData$Europe,ylab = "EU",xlab = "Aisa",pch=21)

cells <- c(1,26,24,68)
rnames <- c("R1","R2")
cnames <- c("C1","C2")
cells
cnames
rnames
mymatrix <- matrix(cells,nrow = 2,ncol = 2,byrow = T,dimnames = list(rnames,cnames))
mymatrix
dim(mymatrix)
class(mymatrix)
str(mymatrix)

x <- matrix(1:20,nrow = 5,ncol = 4)
y <- matrix(20:1,byrow = T,nrow = 5,ncol = 4)
z <- cbind(x,y[,4])
z
