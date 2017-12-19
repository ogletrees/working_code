library(jsonlite)
library(sf)
library(mapview)

# the geojson file
g1 <- "file.json"

# read with sf
g1_sf <- read_sf(g1)

# view perhaps
mapview(g1_sf)
# write table to geopackage, make geopackage if not already there
st_write(g1_sf, dsn = "E:/blahblah.gpkg", layer = "s1_l12", driver = "SQLite")

#-------------------------------------------------------
# the geojson file
g2 <- "file.json"

# read with sf
g2_sf <- read_sf(g2)

# view perhaps
mapview(g2_sf)

# write table to geopackage, make geopackage if not already there
st_write(g1_sf, "E:/data.gpkg", "s1_l12", update = TRUE)
#-------------------------------------------------------

st_layers("E:/data.gpkg")

# maybe try to update with some changes
st_write(g2_sf, "E:/data.gpkg", "s1_l03", update = TRUE)

st_layers("E:/data.gpkg")

# test read back
x <- st_read(dsn = "E:/data.gpkg", layer = "s1_l12")
mapview(x)
