# Data

The MSOA boundaries come from [Middle Layer Super Output Areas (December 2011) Boundaries EW BGC](https://geoportal.statistics.gov.uk/datasets/middle-layer-super-output-areas-december-2011-boundaries-ew-bgc) released [under the Open Government Licence](https://www.ons.gov.uk/methodology/geography/licences). Each MSOA is in a separate geojsonl file in this directory with a name of the form `E02006934.geojsonl`.


## How we generated them

We downloaded the shapefile for generalised clipped boundaries from the ONS and loaded it into [QGIS](https://qgis.org/en/site/). In QGIS we exported the polygons as a `msoa.geojsonl` file with coordinate precision set to 5 and only keeping the properties `msoa11cd`, `msoa11nm`, and `msoa11nmw`. Then we ran the following perl script:

`perl process.pl MSOA11CD/temp/msoa.geojsonl.json MSOA11CD`

Where the first argument is the path to the `geojsonl` file to process and the second argument is the directory to save the output files to. This directory should be the same as the key in the `geojsonl` file (ignoring case).