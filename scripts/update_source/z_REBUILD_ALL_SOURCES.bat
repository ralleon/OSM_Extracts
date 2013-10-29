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
call 2_EXTRACT_cavite.bat
call 2_EXTRACT_cebu.bat
call 2_EXTRACT_metromanila.bat
call 2_EXTRACT_mnl_mandaluyong.bat
call 2_EXTRACT_mnl_manila.bat
call 2_EXTRACT_mnl_pasig.bat
call 2_EXTRACT_pam_candaba.bat
call 2_EXTRACT_pampanga.bat
call 2_EXTRACT_riz_cainta.bat
call 2_EXTRACT_riz_province.bat
call 2_EXTRACT_riz_taytay.bat

call 
call 
call 
call 
call 
call 