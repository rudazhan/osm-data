#!/usr/bin/env bash
OSM_FILE='new_nyc_metro_extracts.pbf'
POLY_FILE=$1
BASE_NAME=${POLY_FILE:0:-5}

# Strategy defaults to "complete_ways"
osmium extract --polygon=${BASE_NAME}.poly ${OSM_FILE} --verbose -o ${BASE_NAME}.osm

# Original version used to create `CoreManhattan.osm`
#osmosis \
#    --read-pbf-fast file=${OSM_FILE} workers=8 \
#    --bounding-polygon cascadingRelations=yes clipIncompleteEntities=true file=${BASE_NAME}.poly \
#    --write-xml file=${BASE_NAME}.osm
