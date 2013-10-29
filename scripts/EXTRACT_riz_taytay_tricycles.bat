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
REM ISO is provincial ISO_CODE found in http://www.statoids.com/uph.html 
REM LGU is the same as your "extract_<ISO>_<LGU>.osm" inside folder "..\source"
REM POI_NAME is the same as your "filter_<poi_name>.txt"
set ISO=riz
set LGU=taytay
set POI_NAME=tricycles
set CSV_FORMAT="@lat @lon name addr:street addr:city amenity"
REM ----------------------------------------------------------
set INPUT="%SOURCE%\extract_%ISO%_%LGU%.osm"
set FILTER="%SCRIPTS%\filter_%POI_NAME%.txt"
set OUT_FILENAME=%ISO%_%LGU%_poi_%POI_NAME%
set UPDATE_ME="%POI%\update_%ISO%_%LGU%_%POI_NAME%.osm"


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