#
# Author:   Cristian E. Nuno
# Date:     March 26, 2020
# Purpose:  Visualize distribution of project rubric points
#

# load necessary packages
library(tidyverse)
library(here)

# load necessary data
rubric_df = 
  read_tsv(here("data/raw/project_rubric_breakdown.tsv")) %>%
  rename_all(str_to_lower) %>%
  mutate(section = factor(section,
                          levels = c("Final Deliverables",
                                     "Documentation",
                                     "Team Process",
                                     "Project Organization")))

# visualize overall ----
rubric_df %>%
  group_by(section) %>%
  summarize(total = sum(points)) %>%
  ggplot(aes(x=reorder(section, -total),
             y=total,
             label=total)) +
  geom_col(fill="#8C1D40") +
  geom_text(position = position_stack(vjust = 0.5),
            color = "#FFC627") +
  ylab("Points") +
  xlab("Section") +
  labs(title = "CPP 528 Project grading rubric by points per section",
       subtitle = "Total project is worth 100 points",
       caption = "Source: https://github.com/DS4PS/cpp-528-spr-2020/blob/master/project/project-rubric.pdf") +
  coord_flip() +
  theme_minimal() +
  theme(panel.grid = element_blank()) +
  ggsave(here("visuals/cpp528_project_rubric_overall.png"),
         dpi = 300)

# visualize final deliverables ----
rubric_df %>%
  ggplot(aes(x=reorder(task, -points),
             y=points,
             label=points,
             fill=section)) +
  geom_col() +
  geom_text(color = "#FFFFFF",
            position = position_stack(vjust = 0.5)) +
  scale_fill_manual(values = c("#78BE20",
                               "#FF7F32",
                               "#5C6670",
                               "#00A3E0")) +
  xlab("Tasks") +
  ylab("Points") +
  labs(title = "CPP 528 Project grading rubric by tasks by points per section",
       subtitle = "Total project is worth 100 points",
       caption = "Source: https://github.com/DS4PS/cpp-528-spr-2020/blob/master/project/project-rubric.pdf") +
  coord_flip() +
  guides(fill = FALSE) +
  facet_wrap(facets = vars(section),
             nrow = 1,
             ncol = 5) +
  theme_minimal() +
  theme(panel.grid.minor = element_blank(),
        panel.grid.major.x = element_blank()) +
  ggsave(here("visuals/cpp528_project_rubric_tasks.png"),
         dpi = 300)
