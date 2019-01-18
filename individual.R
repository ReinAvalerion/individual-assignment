setwd("C:/Users/Reina Borst/Desktop/UCU sem 4/Data Analysis for LAS/Individual Assignment/individual-assignment")
library(tidyverse)

philippines <- read.csv('philippines.csv', stringsAsFactors=FALSE) %>%
  mutate(
    ToV_text = case_when(
      type_of_violence == 1 ~ 'State based confict',
      type_of_violence == 2 ~ 'Non-state conflict',
      type_of_violence == 3 ~ 'One-sided conflict'
    )
  )

ggplot(data = philippines) +
  geom_bar(
    stat = 'count',
    mapping = aes(x=year, fill = ToV_text)
  )

phil_per_year <- philippines %>% 
  group_by(year) %>%
  summarize(n_instances = n())


thailand <- read.csv('thailand.csv', stringsAsFactors=FALSE) %>%
  mutate(
    ToV_text = case_when(
      type_of_violence == 1 ~ 'State based confict',
      type_of_violence == 2 ~ 'Non-state conflict',
      type_of_violence == 3 ~ 'One-sided conflict'
    )
  )

ggplot(data = thailand) +
  geom_bar(
    stat = 'count',
    mapping = aes(x=year, fill = ToV_text)
  )

thai_per_year <- thailand %>% 
  group_by(year) %>%
  summarize(n_instances = n())

combined_year <- phil_per_year
combined_year$thai_instance = thai_per_year[match(combined_year$n_instances, thai_per_year$n_instances),"n_instances"]

#ggplot(aes(x = dates, y = budget_num, colour = original_language), data = some_lang) + geom_point()
