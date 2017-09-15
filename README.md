# Readme

OSM extracts and preparation scripts for nyctaxi.

`new_nyc_metro_extracts.pbf` is the snapshot extract for the publications.
A backup copy has been uploaded to Dropbox under directory `data/`.

Tricks/Makeshifts:

1. Remove negative signs of JOSM created objects not uploaded to OSM:
```
sed -r "s/((id|ref)=')-/\1/" CoreManhattan_ways.osm > CoreManhattan_ways.sed.osm
```
