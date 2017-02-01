#!/bin/sh
osmupdate new_nyc_metro_extracts.pbf new_nyc_metro_extracts2.pbf
mv -f new_nyc_metro_extracts2.pbf new_nyc_metro_extracts.pbf
osmosis \
   --read-pbf-fast file='new_nyc_metro_extracts.pbf' workers=8 \
   --bounding-polygon cascadingRelations=yes clipIncompleteEntities=yes file=CoreManhattan.poly \
   --write-xml file=CoreManhattan.osm
