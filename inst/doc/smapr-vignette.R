## ------------------------------------------------------------------------
library(smapr)
library(raster)
available_data <- find_smap(id = "SPL3SMAP", date = "2015-05-25", version = 3)
str(available_data)

## ------------------------------------------------------------------------
downloads <- download_smap(available_data)
str(downloads)

## ------------------------------------------------------------------------
list_smap(downloads, all = FALSE)
list_smap(downloads, all = TRUE)

## ---- fig.align='center', fig.width=8, fig.height=7----------------------
sm_raster <- extract_smap(downloads, "Soil_Moisture_Retrieval_Data/soil_moisture")
plot(sm_raster, main = "Level 3 soil moisture: May 25, 2015")

## ------------------------------------------------------------------------
writeRaster(sm_raster, "wgs84_ft.tif")

## ---- echo = FALSE, results='hide'---------------------------------------
# cleanup
file.remove("wgs84_ft.tif")

