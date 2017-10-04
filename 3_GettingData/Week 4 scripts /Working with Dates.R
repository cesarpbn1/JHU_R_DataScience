d1 = date()
d1
class(d1)

d2 =Sys.Date()
d2
class(d2)

format(d2, "%a %b %d")
format(d2, "%A %d %B %Y")

x = c("1jan1960", "2jan1960", "30jul1960"); z = as.Date(x, "%d%b%Y")
z
## by substracting dates you can find out how many days you are apart; numeric or not
z[1] - z[2]
as.numeric(z[1] - z[2])
weekdays(d2)
months(d2)

## commmand "julian" is date command the number of days since the origin date
julian(d2)

##command " lubridate " coverts a number to a date regardless of the format
## uses command "wday" at times
install.packages("lubridate")
library(lubridate)
ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")
## year/month/date and hours/mintues/seconds
ymd_hms("2011-08-03 10:15:03")
## change timezone
ymd_hms("2011-08-03 10:15:03", tz = "Pacific/Auckland")
?Sys.timezone

x = dmy(c("1jan2013", "2jan2013", "31mar2013", "30jul2013"))
wday(x[1])
wday(x[1], label =  TRUE)


