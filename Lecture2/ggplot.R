library(tidyverse)

#primitives
a <- ggplot(economics, aes(date, unemploy))
b <- ggplot(seals, aes(x = long, y = lat))

a + geom_ribbon(aes(ymin=unemploy - 900,
                    ymax=unemploy + 900))

#one variable continuous
c <- ggplot(mpg, aes(x=hwy))
c2 <- ggplot(mpg)
c + geom_area(stat = "bin")
c + geom_density(kernel = "gaussian")
c + geom_histogram(binwidth = 5) 

#one variable discrete
d <- ggplot(mpg, aes(fl))
d + geom_bar()

#two variables; continuous x, y
e <- ggplot(mpg, aes(cty, hwy))

e + geom_label(aes(label = cty), nudge_x = 1,
               nudge_y = 1, check_overlap = TRUE) 
e + geom_jitter(height = 2, width = 2)

e + geom_point()
e + geom_quantile()
e + geom_rug(sides = "bl")
e + geom_smooth(method = lm)
e + geom_text(aes(label = cty), nudge_x = 1,
              nudge_y = 1, check_overlap = TRUE)


#discrete x , continuous y
f <- ggplot(mpg, aes(class, hwy))
f + geom_col()
f + geom_boxplot()
f + geom_dotplot(binaxis = "y", stackdir =
                   "center")
f + geom_violin(scale = "area")

#Three variables
seals$z <- with(seals, sqrt(delta_long^2 + delta_lat^2))
l <- ggplot(seals, aes(long, lat))
l + geom_contour(aes(z = z))
