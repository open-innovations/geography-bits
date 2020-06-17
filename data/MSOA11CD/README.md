# Data

The MSOA boundaries come from [Middle Layer Super Output Areas (December 2011) Boundaries EW BGC](https://geoportal.statistics.gov.uk/datasets/middle-layer-super-output-areas-december-2011-boundaries-ew-bgc) released [under the Open Government Licence](https://www.ons.gov.uk/methodology/geography/licences).

We first downloaded the shapefile and loaded it into QGIS. In QGIS we exported the shapes as a `msoa.geojsonl` file with coordinate precision set to 5 and only keeping the properties `msoa11cd`, `msoa11nm`, and `msoa11nmw`.

`perl process.pl MSOA11CD/temp/msoa.geojsonl.json MSOA11CD`

Where the first argument is the path to the `geojsonl` file to process and the second argument is the directory to save the output files to. This directory should be the same as the key in the `geojsonl` file (ignoring case).