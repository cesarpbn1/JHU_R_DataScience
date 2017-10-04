library(swirl)
install.packages("swirl")
cesarpbn1

library(swirl)
install_from_swirl("Getting_and_Cleaning_Data")
swirl()


library(dplyr)
cran <- tbl_df(mydf)
rm("mydf")
print(cran)
cran

?group_by()
?group_by
group_by(cran)
by_pakage <- group_by(cran, package)
by_package <- group_by(cran, package)
by_package

summarize(by_package, mean(size))
submit()
pack_sum

quantile(pack_sum$count, probs = 0.99)
top_counts <- filter(nrows= packsum> 679)
top_counts <- filter(pack_sum, count > 679)
top_counts

View(top_counts)
top_counts_sourted <- arrange(top_counts, count)
top_counts_sourted <- arrange(top_counts, desc(count))
top_counts_sorted <- arrange(top_counts, desc(count))
View(top_counts_sorted)

quantile(pack_sum$unique, probs = 0.99)
top_unique <- filter(pack_sum, unique > 465)
View()
View(top_unique)
top_unique_sorted <- arrange(top_unique, desc(unique))
View(top_unique_sorted)

print(result1)
submit()

submit()

submit()

View(result3)

submit()

submit()

submit()

submit()




















