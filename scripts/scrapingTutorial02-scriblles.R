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

===========================
  
# Study the following code to extract information from a list
  
# create empty data frame to fill  
layoff_df <- data.frame(NULL)
# extract data of interest from each nested year-month list  

for(i in seq_along(layoffs$Results$series[[1]]$data)) {
  df <- data.frame(layoffs$Results$series[[1]]$data[i][[1]][1:4])
  layoff_df <- rbind(layoff_df, df)
}

layoff_df %>% mutate(valueNum = as.integer(value)) %>% arrange(desc(valueNum))

glimpse(layoff_df)

# Disecting the previous code in item 23
for(i in seq_along(layoffs$Results$series[[1]]$data)) {
  df <- data.frame(layoffs$Results$series[[1]]$data[i][[1]][1:4])
}
seq_along(layoffs$Results$series[[1]]$data)
df
