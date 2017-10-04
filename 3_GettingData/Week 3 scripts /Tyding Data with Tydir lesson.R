library(tidyr)

students
?gather 
gather(students, sex, count, -grade)

students2
res <- gather(students2, sex_class, count, -grade)
res
?separate
separate(res, sex_class, c("sex", "class"))
submit()

students3
submit()
spread(students3)
?spread
submit()
extract_numeric("class5")
submit()

students4
submit()
submit()
submit()

passed
failed
passed <- passed (mutate(status = "passed"))
passed <- passed %>% mutate(status = "passed"))
failed <- failed %>% mutate(status = "failed"))
bind_rows(passed, failed)

print('sat')
sat
submit()
submit()














