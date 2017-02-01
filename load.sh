#!/usr/bin/env bash
PROFILE=~/repo/CLionProjects/osrm-backend/profiles/car.lua
OSM_FILE=$1
OSRM_FILE=${OSM_FILE:0:-4}.osrm
osrm-extract -p ${PROFILE} --generate-edge-lookup ${OSM_FILE} | grep 'info' | egrep '(node|edge|component)' | grep '[0-9]' --color=always
osrm-contract ${OSRM_FILE} --core 0 | grep 'info' | grep 'edge' | grep '[0-9]' --color=always
osrm-datastore --max-wait=1 ${OSRM_FILE}
