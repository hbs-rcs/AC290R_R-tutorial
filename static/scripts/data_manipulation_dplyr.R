# Data manipulation with dplyr

library('dplyr')
library('readr')
gapminder <- read_csv("data/gapminder-FiveYearData.csv")

str(gapminder)
unique(gapminder$country)

# just the US
filter(gapminder, country == "United States")
filter(gapminder, country == "United States" & year > 2000)
filter(gapminder, country == "United States" | country == "Mexico")

# selecting columns
select(gapminder, country, lifeExp)
gapCountryExp <- select(gapminder, country, lifeExp)
head(gapCountryExp)
head( select(gapminder, country, lifeExp) )

# sorting
head( arrange(gapminder, pop) )
tail( arrange(gapminder, pop) )
head( arrange(gapminder, desc(pop)))

head( arrange(gapminder, desc(pop), desc(gdpPercap)))

# using pipes
gapminder %>%
  filter(country == "United States") %>%
  select(country, lifeExp) %>%
  head()

# OR
filter(gapminder, country == "United States") %>%
  select(country, lifeExp) %>%
  head()

USLifeExp <-  filter(gapminder, country == "United States") %>% 
  select(country, lifeExp)
USLifeExp

# df with name & years of countries where life expectancy is less than 70,
#    from highest to lowest
lowLifeExp <- gapminder %>%
  filter(lifeExp < 70) %>%
  select(country, year, lifeExp) %>%
  arrange(desc(lifeExp))
lowLifeExp

# do this again, though only for African & Oceanic countries, sorted by the
#   year, from most- to least-recent
AfriOceaLowLifeExp <- gapminder %>%
  filter(continent == "Oceania" | continent == "Africa") %>%
  filter(lifeExp < 70) %>%
  select(country, year, lifeExp) %>%
  arrange(desc(year))
AfriOceaLowLifeExp

# mutate to make new columns
mutate(gapminder, total_gdp = gdpPercap * pop,
       nonsense = year / 100) %>%
  head()

# grouping and summarizing
gapminder %>%
  group_by(year) %>%
  summarise(mean_gdp = mean(gdpPercap), median_gdp = median(gdpPercap))
