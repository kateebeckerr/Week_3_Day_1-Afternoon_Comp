#entire thing is like working in an entire code chunk, comment out everything you dont want to run
#------------Section 1: Filter-----------------#

library(tidyverse)
library(palmerpenguins)
install.packages("lterdatasampler")
library(lterdatasampler)

#look for an exact match: ==
penguins_biscoe <- penguins %>%  filter(island == "Biscoe")
penguins_2007 <- penguins %>% filter(year == 2007)
adelie_torgersen <- penguins %>% filter(species == "Adelie" & island == "Torgersen")
#alternative penguins %>% filter(species == "Adelie", island = "Torgersen")

#subset form penguins only ocntaining gentoo penguins observed in 2008 

gentoo_2008 <- penguins %>% filter(species == "Gentoo" & year == "2008")

#keep any row where species matchs gentoo or adelie , cant use and sign
gentoo_adelie <- penguins %>% filter(species == "Gentoo" | species == "Adelie")

#keep subset that contains observations where the isladn is dream or the year is 2009 , on dream island gets into subset if its from 2009

dream_2009 <- penguins %>% filter(island == "dream" | year == "2009")

#make a ggplot cahrt of water temp vs. crab size

ggplot(data = pie_crab, aes(x = water_temp, y = size)) +
  geom_point()

#burgmens rule , within samespecies in cooler temps species will be larger due to molting and therefore not growing 

#keep obserations for NIB, ZI, DB, and JC
pie_crab %>% filter(site == 'NIB' | site == "ZI" | site == "DB" | site =="JC")

#can use the %in% operator to ask does this value in our column match any of the valuees in this vector 

pie_sites <- pie_crab %>% filter(site %in% c("NIB", "ZI", "DB", "JC"))

#vector that 

sites <- c("CC", "BB", "PIE")
pie_sites_2 <- pie_crab %>% filter(site %in% sites) # if use site == sites it asks for vector in that order, 1st row does this site value match CC get rid of it match BB gets rid of, want every single row asking if it amches CC, BB, PIE need in!!!

#create subset using in operator that includes site pie, zi, nbi, bb, and cc

pie_crab %>% filter(site %in% c("PIE", "ZI", "NIB", "BB", "CC"))

#exluding filter statements, != 

# != (asks is this NOT equal to that value)?\\\ kept is any row where this is true

exlude_zi <- pie_crab %>% filter(site != "ZI")

# what if i want to exlude sites "BB", "CC", "PIE"

#SOMETHING BESIDES THE VALUE FOO SITE EXISTING IN THIS VECTOR 
exlude_bb_cc_pie <- pie_crab %>% filter(!site %in% c("BB", "CC", "PIE"))

# create a subset from pie_crab that only contains observations from NIB, CC, and ZI for crabs with carapace size exceeding 13

exlude_13_cara <- pie_crab %>% filter(site %in% c("NIB", "CC", "ZI"), 
                                     size > 13)

##-----select columns--------#
# select individual columns by name, sperate them by a comma 
crab_subset <- pie_crab %>% select(latitude, size, water_temp)

# select a range of columns 
crab_subset2 <- pie_crab %>% select(site:air_temp)

# select a range and individual colu,m 
crab_subset3 <- pie_crab %>% select(date:air_temp, name)

pie_crab %>% select(name, water_temp, size)

#use dplyr:: mutate to add or update a column while keepig all existing col
#mutate add col while keeping existing cols
crabs_cm <- pie_crab %>%
  mutate(size_cm = size / 10)

#what happens if I use mutate to add new col containing the mean of size colummn 

crabs_mean <- pie_crab %>%
  mutate(mean_crab = mean(size, na.rm = TRUE))

#group by this allwos you to make standardized data 

crabs_Awesome <- pie_crab %>%
  mutate(name = "Teddy is awesome") #constant value, deletes other name colu,n, do not overwrite col just add new ones!!!!!!

# mutate with group_by (r recognzies under the hood that discreete groups exist in a varibale whatever comes next assumes you wanna do it by gorup, sum then summarizes sum statistic in group or independent and return in nice table)

#reminder: group_by + sumamrize 
#group by site and mean of crab size 

mean_size_by_site <- pie_crab %>%
  group_by(site) %>%
  summarize(mean_size = mean(size, na.rm = TRUE),
            sd_size = sd(size, na.rm = TRUE))

#what about a group by then mutate? mutate adds a new col containing new seet of values
group_mutate <- pie_crab %>%
  group_by(site) %>%
  mutate(mean_size = mean(size, na.rm=TRUE))
view(group_mutate)  

group_mutate <- pie_crab %>%
  group_by(site) %>%
  mutate(mean_size = mean(size, na.rm=TRUE))
view(group_mutate)  


penguins %>%
  group_by(species, island, year) %>%
  summarize(mean_body_mass = mean(body_mass_g, na.rm = TRUE))

#new variable with conditional based on existing value in data, wanted to create new col in pie_crab that contains "giant" if thee size is greater than 35 or not giant if the size is less than or equal to 35? 

#use dply::case_when() to write if-else statements more easliy
crabs_bin <- pie_crab %>% 
  mutate(size_binned = case_when(
    size > 20 ~ "giant", 
    size <= 20 ~ "not giant"
  )) 

#rather than contains constant like hello, if size is gerater than 35 then opualte new col with this string otherwisse new col with this string 

sites_binned <- pie_crab %>%
  mutate(region = case_when(
    site %in% c("ZI", "CC", "PIE") ~ "LOW",
    site %in% c("BB", "NIB") ~"MIDDLE", 
    .default = "HIGH" 
  ))

# IF ANYTHIGN ELSE IS TRUE CONTAIN HIGH

view(pie_crab)


