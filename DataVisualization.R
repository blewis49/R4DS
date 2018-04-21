install.packages("tidyverse")
library(tidyverse)

data("mpg")
mpg
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_wrap(~ class, nrow = 2)
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = drv, y = cyl))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .) # no col dim, only row dim

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl) # no row dimension, only a column dim

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), se = F)

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv, color = drv))

# -------------Exercises----------------
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth(se = F) #the global aesthetics carried forward to both the geom_point and the geom_smooth objects

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv))
#if aesthetics are mapped, the geom will provide a legend even if omitted.  To remove a legend, you must explicitly set the arg to false

#6a
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se = F)
#6b
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(aes(linetype = drv), show.legend = F, se = F)
#6c
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  geom_smooth(se = F)
#6d
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth(se = F)
#6e
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(aes(color = drv)) +
  geom_smooth(aes(linetype = drv), se = F)
#6f
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = drv))

# ------------Statistical Transformations ------------

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))
#geom_bar uses a stat to transform the data into a count of the total diamonds rather than reporting the raw values of the dataset.

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))
#the two dots (..) indicate this is a transformed stat and not the raw data
#the group = 1 is a 'dummy' grouping to ensure we calculate the proportion of each cut from the total

