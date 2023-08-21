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




