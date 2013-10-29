@ECHO OFF
cd /d %~dp0
pushd ..\..
set OSM=%cd%
set MAPERITIVE=%OSM%\Maperitive
set UTIL=%OSM%\utilities
set SCRIPTS=%OSM%\scripts
set SOURCE=%OSM%\source
set POLY=%OSM%\bounding_poly
set POI=%OSM%\poi_extracts
REM ----------------------------------------------------------
REM ISO is a 3-letter provincial ISO_CODE (in small caps) 
REM LGU is the name of province/city/barangay (in small caps; use "underscore" between words)
REM Verify BOUNDARY's spelling (case-sensitive with close-quotes) 
REM Click any portion of the boundary in JOSM, then see "Properties/Memberships section > Member Of" 
REM take note of the example--> boundary[6]("Manila",116 members....) 
REM sample admin_Level: region=3 province=4 city/town=6 zones=9 barangay=10

set ISO=riz
set LGU=brgy_san_juan
set BOUNDARY="San Juan"
set ADMIN_LEVEL=10

REM ----------------------------------------------------------
set INPUT="%SOURCE%\philippines-latest.osm"
set OUT_FILENAME=BOUNDARY_%ISO%_%LGU%

REM extract objects along administrative boundary
pushd %UTIL%
osmfilter %INPUT% -v --keep="admin_level=%ADMIN_LEVEL% and name=%BOUNDARY%" --drop-relations --drop-nodes="place=" --drop-tags="*=" -o="%POLY%\%OUT_FILENAME%.osm"

popd
popd

REM OTHER References:
REM OSMFILTER http://wiki.openstreetmap.org/wiki/Osmfilter
REM ADMIN_LEVEL http://wiki.openstreetmap.org/wiki/Tag:boundary%3Dadministrative