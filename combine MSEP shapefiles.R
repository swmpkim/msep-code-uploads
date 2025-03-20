library(sf)
library(dplyr)


in_path <- here::here("GIS combined")


msep_0317_with_Subbasins <- st_read(here::here(in_path,
                                               "0317_with_Subbasins.shp"), quiet = TRUE)
msep_0318_with_Subbasins <- st_read(here::here(in_path,
                                               "0318_with_Subbasins.shp"), quiet = TRUE)


# the combination of 0317 and 0318 is the total watershed area in MS
# coastal subbasin file looks like a repeat of 0317

# combine into a single sf data frame
msep_sf <- dplyr::bind_rows(msep_0317_with_Subbasins, msep_0318_with_Subbasins)

st_write(msep_sf, here::here("MSEP_withSubbasins.shp"))
