library(dplyr)
library(tidyr)
library(tidyverse)


harvest <- read_csv("HomeHarvest.csv")
str(harvest)
head(harvest)
harvest <- harvest %>%
  select(property_id, listing_id, mls, mls_id, status, style, street, unit, city, state, zip_code, beds, full_baths, half_baths, sqft, year_built, days_on_mls, list_price, list_date, sold_price, last_sold_date, assessed_value, estimated_value, tax, new_construction, lot_sqft, price_per_sqft, latitude, longitude, neighborhoods, county) %>%
  filter(style != "LAND" & !is.na(days_on_mls))

harvest <- harvest %>% mutate("perc_of_list" = harvest$list_price/harvest$sold_price)

select(harvest, "list_price", "list_price_min", "list_price_max", "sold_price")
max(harvest$list_price_max)
sum(is.na(harvest$list_price_max), is.na(harvest$list_price_min))

mean(harvest$list_price/harvest$sold_price)
harvest$list_price/harvest$sold_price
sum(is.na(harvest$list_price))
max(harvest$last_sold_date)
min(harvest$last_sold_date)
sum(is.na(harvest$days_on_mls))

days_on_mls_filter <- filter(harvest, is.na(days_on_mls))
nchar(harvest$style)
substr(harvest$style, 1,4)
