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
REM EDIT town or city NAME, desired POI !!!! 
REM ISO is provincial ISO_CODE found in http://www.statoids.com/uph.html (in small caps)
REM LGU is the same as your "extract_<ISO>_<LGU>.osm" inside folder "..\source"
REM POI_NAME is the same as your "filter_<poi_name>.txt"
set ISO=boh
set LGU=
set POI_NAME=fixme
REM ----------------------------------------------------------
set INPUT="%SOURCE%\extract_%ISO%_%LGU%.osm"
set FILTER="%SCRIPTS%\filter_%POI_NAME%.txt"
set OUT_FILENAME=%ISO%_%LGU%_poi_%POI_NAME%
set UPDATE_ME="%MAPERITIVE%\Temp\update_%ISO%_%LGU%_%POI_NAME%.osm"

pushd %UTIL%
REM extract all similar nodes and polygons POI's 
osmfilter %INPUT% --parameter-file=%FILTER%

REM copy node+polygon file for easier JOSM-batch-updating (eg. add addr:city addr:state)
move temp1.osm %UPDATE_ME%

popd
popd