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

pushd %UTIL%
rem CONVERT pbf to osm format
set INPUT="%SOURCE%\philippines-latest.osm.pbf"
set OUTPUT="%SOURCE%\philippines-latest.osm"
osmconvert -v %INPUT% -o=%OUTPUT%

popd
popd
