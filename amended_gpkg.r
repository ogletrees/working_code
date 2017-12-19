# Date: 2017-12-19    
# Description: take a bunch of geojson and put into a geopackage
# S Ogletree
#

library(jsonlite)
library(sf)
library(mapview)
library(rgdal)
library(dplyr)
library(DBI)
library(readr)

# the geojson file
g1 <- "data/park_0.json"

# read with sf
g1_sf <- read_sf(g1)

# view perhaps
# mapview(g1_sf)
# write table to geopackage, make geopackage if not already there
st_write(g1_sf, dsn = "park_points.gpkg", layer = "pp_0", driver = "SQLite", update = TRUE)


# the geojson file
g2 <- "data/park_2000.json"

# read with sf
g2_sf <- read_sf(g1)
str(g2_sf)
# view perhaps
# mapview(g2_sf)
# write table to geopackage, make geopackage if not already there
st_write(g2_sf, dsn = "park_points.gpkg", layer = "pp_2000", driver = "GPKG")

st_layers("park_points.gpkg")
# reread <- st_read("park_points.gpkg", layer = "pp_1000")


# with rgdal
# writeOGR(cities, dsn = gpkg.loc, layer = "cities", driver = "GPKG")

# Sometimes you may want to directly access the metadata for your spatial data without loading the object geometry. Because GeoPackage files are formatted as SQLite databases you can use the existing R tools for SQLite files. One option is to use the slick dplyr interface:
# park_sqlite <- tbl(src_sqlite("park_points.gpkg"), "pp_2000")
# print(park_sqlite, n = 5)

list_of_files <- list.files('data/', pattern = "*.json", full.names = TRUE)

# con <- dbConnect(RSQLite::SQLite(), "park_points.gpkg")
# dbExistsTable(con, "pp_2000")
# dbRemoveTable(con, "pp_2000")
# dbDisconnect(con)

for (i in 1:75) {
  x <- list_of_files[i]
  y <- parse_number(x)
  gj <- read_sf(x)
  
  st_write(gj, dsn = "park_points.gpkg", layer = paste0("pp_", y), driver = "GPKG")
}
