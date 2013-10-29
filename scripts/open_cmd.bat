@ECHO OFF
cd /d %~dp0
pushd ..
set OSM=%cd%
set MAPERITIVE=%OSM%\Maperitive
set UTIL=%OSM%\utilities
set SCRIPTS=%OSM%\scripts
set RAW=%OSM%\raw_osm
set POLY=%OSM%\bounding_poly
set POI=%OSM%\poi_extracts

popd
cmd.exe

