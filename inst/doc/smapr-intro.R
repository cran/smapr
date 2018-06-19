## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(purl = NOT_CRAN)

## ----load-smapr----------------------------------------------------------
library(smapr)
library(raster)

## ----find-data, eval = NOT_CRAN------------------------------------------
available_data <- find_smap(id = 'SPL4SMAU', dates = '2018-06-01', version = 3)

## ----download-data, eval = NOT_CRAN--------------------------------------
local_files <- download_smap(available_data)

## ----print-filenames, eval = NOT_CRAN------------------------------------
local_files$name[1:2]

## ----list-smap, eval = NOT_CRAN------------------------------------------
list_smap(local_files[1, ])

## ----list-more-smap, eval = NOT_CRAN-------------------------------------
list_smap(local_files[1, ], all = TRUE)

## ----extract-data, eval = NOT_CRAN---------------------------------------
sm_raster <- extract_smap(local_files, '/Analysis_Data/sm_rootzone_analysis')

## ----print-raster, eval = NOT_CRAN---------------------------------------
sm_raster

## ----plot-raster, fig.width=12, fig.height=8, eval = NOT_CRAN------------
plot(sm_raster)

