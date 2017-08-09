# Define a new function.
suggest <- function(n) {
  for (i in 1:n) {
    my_message <- "R is awesome!\n"
    cat(my_message)
  }
}

# Call that function.
suggest(n = 10)

# Create a new list variable.
person <- list(first_name = "John", last_name = "Chambers")

# Print the person's first name.
cat(person$first_name, "\n")

# basic calculator
3 + 5
2 / (3 + 5)
2 / (3 + 5
     )
a <- 3
a = 3 
loop_counter <-  3
loopCounter <- 3
b <- 4
the_string <- "a literal text string"
nchar(the_string)
c <- 5
c
(c <- 5)

# functions
sqrt(a)
?sqrt()
sqrt(x = a)
?log
log(a)
log(a, x=10)
log(a, base = 10)
log(a, 10)
log(base=10,a)
log(base = 10,
    a)

# data types
race_lengths <- c(1, 5, 10)
race_lengths
cities <- c("boston", "new york", "LA")
cities
race_lengths * 0.62
race_lengths = race_lengths * 0.62
race_lengths
class(race_lengths)
class(2)
str(race_lengths)
race_lengths <- c(race_lengths, 1)
race_lengths
# to see variable in a browser-like window
View(race_lengths)

# challenge from Intro
challenge <- c(1,3,5,7,9)
mean(challenge)
tough_challenge <- c(1,NA,9,11)
tough_challenge
mean(tough_challenge)
?mean
mean(tough_challenge, na.rm=TRUE)

# data frames
animals <- data.frame(
  name = c("Andrew", "Bob", "Carl", "Doug"),
  feel = c("Furry", "Smooth", "Squishy", "Spiny"),
  type = c("Dog", "Cat", "Sea Cucumber", "Sea Urchin"),
  weight_lbs = c(45, 8, 1.1, 0.8)
)
animals
str(animals)

# load in structures
load("data/continents.RDA", verbose = TRUE)
continents
str(continents)
read.csv("data/gapminder-FiveYearData.csv")
gapminder <- read.csv("data/gapminder-FiveYearData.csv")
gapminder
class(gapminder)
str(gapminder)
1:10
10:1
seq(1,10)
?seq
seq(1,10,by=3)
c(1,3,5)
challenge[1]
challenge[2]
challenge[1:3]
challenge[c(1,3)]
challenge[c(1,2:4)]
animals[1,1]
animals[1:3,1]
animals[1:3,1:2]
animals[,3]
animals[3,]

# indexing challenge
even_continents <- continents[seq(2,nrow(continents),by=2),]
even_continents

continents$continent
continents[,c("continent","population")]
continents[2:4,c("continent","population")]
continents[continents$population > 29127001, ]
str(animals)

# dply
install.packages('dplyr',repos='http://cran.us.r-project.org')
library('dplyr')
str(gapminder)
gapminder <- read.csv("data/gapminder-FiveYearData.csv", stringsAsFactors = FALSE)
str(gapminder)
unique(gapminder$country)
# filter by rows
filter(gapminder, country == "United States")
filter(gapminder, country == "United States" & year > 2000)
filter(gapminder, country == "United States" | country == "Mexico")
View(gapminder)
# select by columns
select(gapminder, country, lifeExp)
head(select(gapminder, country, lifeExp))
tail(select(gapminder, country, lifeExp))
gapCountryExp <-select(gapminder, country, lifeExp)
str(gapCountryExp)
# sort
head(arrange(gapCountryExp,lifeExp))
# reverse srot
head(arrange(gapCountryExp,desc(lifeExp)))
head(arrange(gapminder, desc(year), desc(gdpPercap)))
head(arrange(gapminder,  desc(gdpPercap), desc(year)))

# pipes

# OK way
arrange(filter(gapminder, lifeExp > 80), gdpPercap)
lifeExpectGreater80 <- filter(gapminder, lifeExp > 80)
arrange(lifeExpectGreater80)

# awful way
gapCountryExp <-select(gapminder, country, lifeExp)
gapCountryExpFilter <- filter(gapCountryExp, lifeExp > 80)
gapCountryExpFilterSort <-arrange(gapCountryExpFilter, lifeExp)
head(gapCountryExpFilterSort)

# also awful
head(arrange(filter(select(gapminder, 
                           country, lifeExp), 
                    lifeExp > 80), 
             lifeExp))

# using the pipe %>% functionality, but don't save
filter(gapminder, lifeExp > 80) %>% 
  arrange(gdpPercap)

# pipe & save to variable
gapCountryExpFilterSort <- filter(gapminder, lifeExp > 80) %>% 
  arrange(gdpPercap)
str(gapCountryExpFilterSort)

# nicer way to do the former -- show data source by itself
gapCountryExpFilterSort <- gapminder %>% 
  filter(lifeExp > 80) %>% 
  arrange(gdpPercap)
gapCountryExpFilterSort

# with smaller variable name
small_gap <- gapminder %>% 
  filter(lifeExp > 80) %>% 
  arrange(gdpPercap)
small_gap

# pipe to head and other base functions
gapminder %>% 
  filter(lifeExp > 80) %>%
  head

# mutate -- adding a column
#
# include new column name & opeation to obtain columns
total_gdp <- gapminder %>%
  mutate( gdp = pop * gdpPercap)
head(total_gdp)

# mutate -- adding more than one column: separate by commas
gapminder %>%
  mutate( gdp = pop * gdpPercap, logPerCap = log(gdpPercap)) %>%
  head

# summary command not too useful
summary(gapminder)

# summarize with group_by to get at analysis on a grouping
#
# same as mutate: new column name + operation on column
gapminder %>%
  group_by(year) %>%
  summarize(mean_gdp = mean(gdpPercap))


# base R graphing
plot(gapminder$year, gapminder$lifeExp)
hist(gapminder$lifeExp)

# ggplot2 example
library("ggplot2")

ggplot(gapminder, aes(x = year, y = lifeExp)) + 
  geom_point()

# challenge: create a histogram of life expectancy using ggplot2
# hint: check out the `geom_histogram()` function
ggplot(gapminder, aes(x = lifeExp)) + 
  geom_histogram()

ggplot(gapminder, aes(x = year, y = lifeExp, group = country)) +
  geom_point(color = "red") +
  geom_line() +
  facet_grid(continent ~ .) +
  geom_text(aes(label = country), data = gapminder %>% filter(year == max(year))) +
  theme_bw()

