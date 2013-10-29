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
REM EDIT town or city NAME, desired POI, CSV format HERE !!!! 
REM ISO is provincial ISO_CODE found in http://www.statoids.com/uph.html (in small caps)
REM LGU is the same as your "extract_<ISO>_<LGU>.osm" inside folder "..\source"
REM POI_NAME is the same as your "filter_<poi_name>.txt"
set ISO=riz
set LGU=taytay

REM ----------------------------------------------------------
set INPUT="%SOURCE%\extract_%ISO%_%LGU%.osm"
set FILTER="%SCRIPTS%\filter_address_tags.txt"
set UPDATE_ME="%POI%\update_ADDRESS_TAGS_%ISO%_%LGU%.osm"

REM extract all similar nodes and polygons POI's
pushd %UTIL%
osmfilter %INPUT% --parameter-file=%FILTER%

REM copy node+polygon file for easier JOSM-batch-updating (eg. add addr:city addr:state)
copy temp1.osm %UPDATE_ME%

popd
popd