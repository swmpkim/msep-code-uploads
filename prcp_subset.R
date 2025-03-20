library(ncdf4)
library(raster)
library(sf)

# MSEP ----

msep <- st_read(here::here("MSEP_shapefile",
                           "MSEP_withSubbasins.shp"))

# bounding box
msep_bb <- st_bbox(msep)


# precip: 2006-2020 ----
prcp_all <- raster(here::here("NCEI Gridded Precip Data",
                         "prcp-2006_2020-monthly-normals-v1.0.nc"))

prcp_msepbb <- crop(prcp_all, msep_bb)


# combine ----
crs(prcp_msepbb) 
st_crs(msep)  # "EPSG",4269   NAD83

# update the sf file's crs to that of the raster file
msep <- st_transform(msep, crs(prcp_msepbb))

# intersect them
intersected_raster <- mask(prcp_msepbb, msep)
# plot it
image(intersected_raster)
# write it out
writeRaster(intersected_raster, here::here("NCEI Gridded Precip Data",
                                           "prcp-2006_2020-msep.nc"))



# precip: 1991-2020 ----
prcp_all <- raster(here::here("NCEI Gridded Precip Data",
                              "prcp-1991_2020-monthly-normals-v1.0.nc"))
# crop to the bounding box
prcp_msepbb <- crop(prcp_all, msep_bb)


# combine ----
crs(prcp_msepbb) 
st_crs(msep)  # "EPSG",4269   NAD83

# update the sf file's crs to that of the raster file
msep <- st_transform(msep, crs(prcp_msepbb))

# intersect them
intersected_raster <- mask(prcp_msepbb, msep)
# plot it
image(intersected_raster)
# write it out
writeRaster(intersected_raster, here::here("NCEI Gridded Precip Data",
                                           "prcp-1991_2020-msep.nc"))



# precip: 1901-2000 ----
prcp_all <- raster(here::here("NCEI Gridded Precip Data",
                              "prcp-1901_2000-monthly-normals-v1.0.nc"))

prcp_msepbb <- crop(prcp_all, msep_bb)


# combine ----
crs(prcp_msepbb) 
st_crs(msep)  # "EPSG",4269   NAD83

# update the sf file's crs to that of the raster file
msep <- st_transform(msep, crs(prcp_msepbb))

# intersect them
intersected_raster <- mask(prcp_msepbb, msep)
# plot it
image(intersected_raster)
# write it out
writeRaster(intersected_raster, here::here("NCEI Gridded Precip Data",
                                           "prcp-1901_2000-msep.nc"))
