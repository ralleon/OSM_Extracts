@ECHO OFF
cd /d %~dp0
pushd ..
set OSM=%cd%
set MAPERITIVE=%OSM%\Maperitive
set UTIL=%OSM%\utilities
set SCRIPTS=%OSM%\scripts
set SOURCE=%OSM%\source
set POLY=%OSM%\bounding_poly
set POI=%OSM%\poi_extracts

REM ----------------------------------------------------------
REM EDIT desired POI, CSV format HERE !!!! 
REM This will extract POI's from philippines-latest.osm
REM POI_NAME is the same as your "filter_ph_<poi_name>.txt"
REM
set POI_NAME=museum
set CSV_FORMAT="@lat @lon name tourism historic addr:street addr:city addr:state addr:province"
REM
REM ----------------------------------------------------------
set INPUT="%SOURCE%\philippines-latest.osm"
set FILTER="%SCRIPTS%\filter_PH_%POI_NAME%.txt"
set OUT_FILENAME=PH_poi_%POI_NAME%
set UPDATE_ME="%POI%\update_PH_%POI_NAME%.osm"


pushd %UTIL%

REM extract all similar nodes and polygons POI's 
osmfilter %INPUT% --parameter-file=%FILTER%

REM copy node+polygon file for easier JOSM-batch-updating (eg. add addr:city addr:state)
copy temp1.osm %UPDATE_ME%

REM put equivalent-nodes at centroid of polygons
osmconvert temp1.osm --all-to-nodes -o=temp2.osm

REM cleanup any node-remnants of converted polygons (bullet-proofing)
osmfilter temp2.osm --parameter-file=%FILTER%

del temp2.osm

REM create csv poi-file for spreadsheet
osmconvert temp1.osm --csv=%CSV_FORMAT% --csv-separator="," -o="%POI%\%OUT_FILENAME%.csv"

REM POI(node-only-extract) for use by Maperitive 
move temp1.osm "%POI%\%OUT_FILENAME%.osm"

REM kml for Google Earth viewing
gpsbabel -i osm -f "%POI%\%OUT_FILENAME%.osm" -o kml -F "%POI%\%OUT_FILENAME%.kml"

popd
popd