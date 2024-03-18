# Data

The following sub-directories contain individual geojson blobs for:

* __[Combined Authorities 2021](CAUTH21CD/)__ e.g. [CAUTH21CD/E47000003.geojsonl](CAUTH21CD/E47000003.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/ons::combined-authorities-december-2021-en-bgc/explore)(OGL)
* __[Local Authority Districts 2023](LAD23CD/)__ e.g. [LAD23CD/E08000035.geojsonl](LAD23CD/E08000035.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/local-authority-districts-may-2021-uk-bgc/) (OGL) with [merging of authorities](https://en.wikipedia.org/wiki/2019%E2%80%932023_structural_changes_to_local_government_in_England#Changes_in_2023) and the [2023 codes](https://geoportal.statistics.gov.uk/datasets/ons::local-authority-districts-april-2023-names-and-codes-in-the-united-kingdom/about)
* __[Local Authority Districts 2021](LAD21CD/)__ e.g. [LAD21CD/E08000035.geojsonl](LAD21CD/E08000035.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/local-authority-districts-may-2021-uk-bgc/) (OGL)
* __[Local Authority Districts 2020](LAD20CD/)__ e.g. [LAD20CD/E08000035.geojsonl](LAD20CD/E08000035.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2020-uk-bgc) (OGL)
* __[Local Authority Districts 2019](LAD19CD/)__ e.g. [LAD19CD/E08000035.geojsonl](LAD19CD/E08000035.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/local-authority-districts-december-2019-boundaries-uk-bgc) (OGL)
* __[Wards 2023](WD23CD/)__ e.g. [WD23CD/E05011403.geojsonl](WDCD/E05011403.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/1ff1b4c40cf344e7afc05d6d09f16315_0/about)
* __[Wards 2022](WD22CD/)__ e.g. [WD22CD/E05011403.geojsonl](WDCD/E05011403.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/687211df93564622a1c00756e5f0cf78_0/about)
* __[Wards 2020](WD20CD/)__ e.g. [WD20CD/E05011403.geojsonl](WD20CD/E05011403.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/wards-december-2020-uk-bgc-v2) (OGL)
* __[Wards 2019](WD19CD/)__ e.g. [WD19CD/E05011403.geojsonl](WD19CD/E05011403.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/wards-december-2019-boundaries-ew-bgc) (OGL)
* __[Parliamentary constituencies 2017](PCON17CD/)__ e.g. [PCON17CD/E14000777.geojsonl](PCON17CD/E14000777.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/wards-december-2019-boundaries-ew-bgc) (OGL)
* __[MSOAs 2021](MSOA21CD/)__ e.g. [MSOA21CD/E02006875.geojsonl](MSOA21CD/E02006875.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/ons::middle-layer-super-output-areas-december-2021-boundaries-generalised-clipped-ew-bgc) (OGL)
* __[MSOAs 2011](MSOA11CD/)__ e.g. [MSOA11CD/E02006875.geojsonl](MSOA11CD/E02006875.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/middle-layer-super-output-areas-december-2011-boundaries-ew-bgc) (OGL)
* __[LSOAs 2021](LSOA11CD/)__ e.g. [LSOA21CD/E01033011.geojsonl](LSOA21CD/E01033011.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/ons::lower-layer-super-output-areas-december-2021-boundaries-generalised-clipped-ew-bgc/) (OGL)
* __[LSOAs 2011](LSOA11CD/)__ e.g. [LSOA11CD/E01033011.geojsonl](LSOA11CD/E01033011.geojsonl) - source: [ONS](https://geoportal.statistics.gov.uk/datasets/lower-layer-super-output-areas-december-2011-boundaries-ew-bgc) (OGL)
* __[LSOAs 2001](LSOA01CD/)__ e.g. [LSOA01CD/E01011365.geojsonl](LSOA01CD/E01011365.geojsonl) - source: ONS (OGL)

The data is downloaded from ONS GeoPortal as a `.geojson` file and stored in e.g. `WD20CD/temp/`. You will need to make sure there is one feature per line. Also, ONS have a tendency to output OS Easting/Northings rather than valid GeoJSON so you may want to first [fix the GeoJSON](https://open-innovations.github.io/ONS-GeoJSON-Fixer/). Once you have valid GeoJSON run:

```
perl process.pl <FILE> <CODE>

perl process.pl WD20CD/temp/Wards_\(December_2020\)_UK_BGC_V2.geojson WD20CD
```

where `<FILE>` is the location of the `.geojson` file and `<CODE>` is the ONS geocode e.g. `WD20CD`.