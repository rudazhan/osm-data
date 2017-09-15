#!/usr/bin/env bash
# Order of input files may have an impact on the result if some files are incorrect,
# because files are read in order.
# In our case, `CoreManhattan.osm` was created by osmosis with `--clipIncompleteEntities=true`,
# so ways on the northern border are incorrect. Given we now extract `UpperManhattan.osm` with
# osmium whose strategy defaults to "complete_ways", `UpperManhattan_ways.osm` is correct.
# Here we put the correct file in the front, incorrect objects in the second file will be ignored,
# the object with the same identity in the first file is accepted instead.
# Note that this behavior is undefined according to the documentation, so in general you should
# merge only correct files (extracted from the same master file).
osmium merge UpperManhattan_ways.osm CoreManhattan_ways.osm -o ExtendedCoreManhattan.osm --verbose
