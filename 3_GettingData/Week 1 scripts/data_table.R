install.packages("data.table")

## Creating data tables just like data frames using data.table // part I (BEFORE)
library(data.table)
DF = data.frame(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
head(DF, 3)


## Creating data tables just like data frames using dat   a.table //  part II (AFTER)
DT = data.table(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
head(DT, 3)
tables()
  ##See all data tables in memory 

DT[2,]
DT[c(2,3)]
  ## Subsetting rows

DT[DT$y=="a",]
  #accesing Y when y only equals "a"

{
        x= 1
        y =2
}
k ={print(10); 5}
print(k)

DT[, list(mean(x), sum(z))]

DT[, table(y)]
## Good for summarizing data

DT[,w:=z^2]
print(DT)

DT2 <- DT
DT[, y:= 2]
head(DT, n= 3)
head(DT2, n = 3)

#Multiple operation
DT[, m:= {tmp <- (x +z); log2(tmp + 5)}]
## tmp = temporary file 
print(DT)

#PLYR like operations
DT[, a:=x>0]
print(DT)

DT[, b:= mean(x + w), by= a]
print(DT)


## Special varriables : .N an inetger, length 1, conating the number 
set.seed(123);
DT <- data.table(x = sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]
print(DT)

#KEYS
DT <- data.table(x= rep(c("a", "b", "c"), each = 100), y = rnorm(300))
setkey(DT, x)
DT['a']

#JOINS
DT1 <- data.table(x=c('a', 'a', 'b', 'dt1'), y=1:4)
DT2 <- data.table(x=c('a','b','dt2'), z=5:7)
setkey(DT1, x); setkey(DT2,x)
merge(DT1, DT2)

#FASTREADING- much more faster to use to read 
big_df <- data.frame(x =rnorm(1E6), y=rnorm(1E6))
file <- tempfile()
write.table(big_df, file = file, row.names = FALSE, col.names = TRUE, sep = "\t", quote = FALSE)
system.time(fread(file))
system.time(read.table(file, header = TRUE, sep = "\t"))






