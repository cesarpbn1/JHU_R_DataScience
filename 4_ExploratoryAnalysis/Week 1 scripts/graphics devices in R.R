##create simple plot from datasets
library(datasets)
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser Data")


##create a pdf file of the plot created and save it.  
## to save it use the dev.off command 
pdf(file = "myplot.pdf")
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser Data")
dev.off()

getwd()

?Devices
with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")

dev.cur()
pdf(file="myplot.pdf")
with(faithful, plot(eruptions, waiting))
dev.cur()
dev.off() 
dev.cur()

with(faithful, plot(eruptions, waiting))
title(main = "Old Faithful Geyser data")
dev.copy(png, file = "geyserplot.png")
dev.off()


