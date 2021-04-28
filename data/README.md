# Data

The following sub-directories contain individual geojson blobs for:

* __[Local Authority Districts 2020](LAD20CD/)__ e.g. [LAD20CD/E08000035.geojsonl](LAD20CD/E08000035.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2020-uk-bgc) (OGL)
* __[Local Authority Districts 2019](LAD19CD/)__ e.g. [LAD19CD/E08000035.geojsonl](LAD19CD/E08000035.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2019-boundaries-uk-bgc) (OGL)
* __[Wards 2019](WD19CD/)__ e.g. [WD19CD/E05011403.geojsonl](WD19CD/E05011403.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/wards-december-2019-boundaries-ew-bgc) (OGL)
* __[Wards 2020](WD20CD/)__ e.g. [WD20CD/E05011403.geojsonl](WD20CD/E05011403.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/wards-december-2020-uk-bgc-v2) (OGL)
* __[Parliamentary constituencies 2017](PCON17CD/)__ e.g. [PCON17CD/E14000777.geojsonl](PCON17CD/E14000777.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/wards-december-2019-boundaries-ew-bgc) (OGL)
* __[MSOAs 2011](MSOA11CD/)__ e.g. [MSOA11CD/E02006875.geojsonl](MSOA11CD/E02006875.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/middle-layer-super-output-areas-december-2011-boundaries-ew-bgc) (OGL)
* __[LSOAs 2011](LSOA11CD/)__ e.g. [LSOA11CD/E01033011.geojsonl](LSOA11CD/E01033011.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/lower-layer-super-output-areas-december-2011-boundaries-ew-bgc) (OGL)
* __[LSOAs 2001](LSOA01CD/)__ e.g. [LSOA01CD/E01011365.geojsonl](LSOA01CD/E01011365.geojsonl) - source: ONS (OGL)

The data is downloaded from ONS GeoPortal as a `.geojson` file and stored in e.g. `WD20CD/temp/`. We then run:

```
perl process.pl <FILE> <CODE>

perl process.pl WD20CD/temp/Wards_\(December_2020\)_UK_BGC_V2.geojson WD20CD
```

where `<FILE>` is the location of the `.geojson` file and `<CODE>` is the ONS geocode e.g. `WD20CD`.