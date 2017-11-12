# Quick scrape text from R Task View of Web Technologies to count the number of times the word API appears

library(tidytext)
library(dplyr)

data_frame(text = readLines("https://cran.r-project.org/web/views/WebTechnologies.html")) %>%
  unnest_tokens(word, text, format = "html") %>%
  anti_join(stop_words) %>%
  count(word, sort = TRUE) %>%
  filter(word == "api") %>%
  print(n = Inf)

# It appears 80 times