library(yaml)
db_config <- yaml.load_file("~/workspace/data/db_config_quivr.yml")

library(dplyr)
db <- do.call(src_mysql, db_config)

user <- tbl(db, "user")

library(ggplot2)
user %>%
  select(id, date_created) %>%
  group_by(date = substr(date_created, 1, 10)) %>%
  summarise(daily = n()) %>%
  collect() %>% # importeer in R
  mutate(date = as.Date(date), cum_daily = cumsum(daily)) %>%
  ggplot(aes(x = date, y = cum_daily)) + geom_area()

event <- tbl(db, "event")
event %>%
  select(id, date_created) %>%
  group_by(date = substr(date_created, 1, 10)) %>%
  summarise(daily = n()) %>%
  collect() %>%
  mutate(date = as.Date(date), cum_daily = cumsum(daily)) %>%
  ggplot(aes(x = date, y = cum_daily)) + geom_area()

friendship <- tbl(db, "friendship")
friendship %>%
  select(id, date_created) %>%
  group_by(date = substr(date_created, 1, 10)) %>%
  summarise(daily = n()) %>%
  collect() %>%
  mutate(date = as.Date(date), cum_daily = cumsum(daily)) %>%
  ggplot(aes(x = date, y = cum_daily)) + geom_line()
