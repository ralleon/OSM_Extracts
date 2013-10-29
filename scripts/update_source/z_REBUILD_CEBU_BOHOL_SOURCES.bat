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

pushd %OSM%\scripts\update_source
call 0_CONVERT_philippines-latest_pbf2osm.bat
call 2_EXTRACT_bohol.bat
call 2_EXTRACT_cebu.bat