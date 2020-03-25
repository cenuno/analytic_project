#
# Author:   Cristian E. Nuno
# Purpose:  Visualize the distribution of low income schools
#           by overall rating
# Date:     March 18, 2020
#

# load necessary packages ----
library(here)
library(tidyverse)

# load necessary data ----
cps_schools_df <-
  read_csv(here("data/raw/cps_profile_sy1819.csv")) %>%
  # make all column names lower case
  rename_all(.funs = function(i) str_to_lower(i)) %>%
  # cast rating from char to factor
  mutate(clean_overall_rating = factor(overall_rating,
                                       levels = c("Level 1+",
                                                  "Level 1",
                                                  "Level 2+",
                                                  "Level 2",
                                                  "Level 3",
                                                  "Inability to Rate")))

# view the data
cps_schools_df %>% glimpse()

# create the percentage of low income students per school ----
cps_schools_li_df <-
  cps_schools_df %>%
  select(school_id, clean_overall_rating,
         student_count_total, student_count_low_income) %>%
  mutate(per_low_income = student_count_low_income / student_count_total)

# visualize the percentage of low income students by overall rating -----
cps_schools_li_df %>%
  ggplot(aes(x = per_low_income, y = ..scaled..)) +
  geom_density() +
  facet_wrap(facets = vars(clean_overall_rating),
             nrow = 6,
             ncol = 1)
  


# end of script # 
