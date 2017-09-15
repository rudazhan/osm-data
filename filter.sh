#!/usr/bin/env bash
# osmosis pipeline to extract major road network in Core Manhattan:
OSM_FILE=$1
BASE_NAME=${OSM_FILE:0:-4}

# Print file summary including data age
osmium fileinfo -e ${OSM_FILE}

# Extract ways:
#   Atandard road network with link roads;
#   Restrict nodes to those used in the filtered ways;
#   All relations are preserved by default, unless with `--tag-filter reject-relations`.
osmosis \
    --read-xml file=${OSM_FILE} \
    --tag-filter accept-ways "highway=*" \
    --tag-filter reject-ways highway=motorway,motorway_link,living_street,service,pedestrian,footway,cycleway,bridleway,track,path,construction,steps \
    --tag-filter reject-ways motor_vehicle=no \
    --tag-filter reject-ways "tiger:cfcc=A63" \
    --tag-filter reject-ways access=private \
    --tag-filter reject-ways "name=Park%sAvenue%sTunnel,Henderson%sPlace,1st%sAvenue%sTunnel" \
    --tag-filter reject-ways "name=Manhattan%sBridge,Manhattan%sBridge%slower%slevel" \
    --used-node \
    --write-xml file=${BASE_NAME}_ways.osm
