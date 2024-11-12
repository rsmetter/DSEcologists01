##############################################
#
#         Week 06
#
#       "Tue Oct  1 10:53:57 2024"
#
#
#     Revised Nov 12 12:30 2024
##############################################

date()

getwd()
setwd("C:/Users/rjsme/OneDrive - The University of Texas-Rio Grande Valley/GradSchoolFall2024/DataSciR/Week06")

library(ggplot2)
library(dplyr)
library(tigris)
library(sf)

#############################################

manhattan_roads <- roads("NY", "New York")

ggplot(manhattan_roads) +
  geom_sf() +
  theme_void()

ggplot(manhattan_roads) +
  geom_sf()

?roads

hidalgo_roads <- roads("TX", "Hidalgo")

ggplot(hidalgo_roads) +
  geom_sf() 

cameron_roads <- roads("TX", "Cameron")

ggplot(cameron_roads) +
  geom_sf()

cameron_roads$FULLNAME

?tigris

?counties

county_subdivisions()

states()

texas_counties <- county_subdivisions("TX")

cameron_county <- counties(state = "TX", resolution = "500k")

View(counties(state = "TX"))

?places

places(state = "TX")

View(places(state = "TX"))

ggplot(texas_counties) +
  geom_sf()

str(places)
class(places)

write.csv(places(state = "TX"), "brownsville_ID.csv")

  list_places("TX")
list.files()
  
#brownsville_ID <- read.csv("brownsville_ID.csv")#

brownsville_coord <- data.frame(
  lon = -97.486917,
  lat = 25.895833
)

##################################
#
#     UTRGV map
#
##################################

places(state = "Texas", cb = FALSE)

ggplot(cameron_roads) +
  geom_sf() +
  geom_point(data = brownsville_coord, aes(x = lon, y = lat),
             color = "red", size = 2)

ggplot(cameron_county) +
  geom_sf() +
  geom_point(data = brownsville_coord, aes(x = lon, y = lat),
             color = "red", size = 3)



ggplot(texas_counties) +
  geom_sf() +
  geom_point(data = brownsville_coord, aes(x = lon, y = lat),
             color = "red", size = 4)


ggplot(texas_counties) +
  geom_sf() +
  geom_point(data = brownsville_coord, aes(x = lon, y = lat),
             color = "red", size = 4)

#########################################
#
#       RASTER DATA
#
#########################################

library(terra)
library(geodata)
install.packages("geodata")

getwd()

directory <- getwd()


bioclim <- geodata::worldclim_global("USA", var = "bio", res = 10 , path = directory)

?geodata

bio1 <- terra::rast("wc2.1_10m_bio_1.tif")
str(bio1)


bio1
plot(bio1)

#tracking test 1


tx_counties <- map_data("county", "texas") 

tx_counties <- map_data("county", "texas") %>% 
  select(lon = long, lat, group, id = subregion)

tx_counties <- map_data("county", "texas") %>% 
  select(lon = long, lat, group, id = subregion)


head(tx_counties)



ggplot(tx_counties, aes(lon, lat, group = group)) +
  geom_polygon(fill = "white", colour = "grey50") + 
  coord_quickmap()

ggplot(tx_counties, aes(lon, lat, group = group)) +
  geom_polygon(fill = "white", colour = "grey50") + 
  coord_cartesian(xlim = c(-97.3,-97.8))

ggplot(tx_counties, aes(lon, lat, group = group)) +
  geom_polygon(fill = "white", colour = "grey50") + 
  coord_cartesian(xlim = c(-97.478,-97.495))+
  coord_cartesian(ylim = c(25.896, 25.894))

ggplot(tx_counties, aes(lon, lat, group = group)) +
  geom_polygon(fill = "white", colour = "grey50") + 
  coord_cartesian(xlim = c(-97.478056,-97.495278))+
  coord_cartesian(ylim = c(25.896944, 25.894167))


#############################################################################
#BEDROCKVERSION
ggplot(tx_counties, aes(lon, lat, group = group)) +
  geom_polygon(fill = "white", colour = "grey50") + 
  coord_cartesian(xlim = c(-97.478056,-97.495278))+
  coord_cartesian(ylim = c(25.896944, 25.894167))

############################################################################

brownsville <- map::abs_ced %>% filter(NAME == "Eden-Monaro")














