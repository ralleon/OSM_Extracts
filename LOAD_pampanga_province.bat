@ECHO OFF
cd /d %~dp0

set OSM=%cd%
set MAPERITIVE=%OSM%\Maperitive
set MAPS=%OSM%\maps
set UTIL=%OSM%\utilities
set SCRIPTS=%OSM%\scripts
set SOURCE=%OSM%\source
set POLY=%OSM%\bounding_poly
set POI=%OSM%\poi_extracts

pushd %MAPERITIVE%
maperitive -defaultscript=false "%cd%\Scripts\load_pam_.mscript"