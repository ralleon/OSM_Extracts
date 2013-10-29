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

rem -------------------
set ISO=boh
set LGU=
rem -------------------

rem This ensures that fixme-extract-file is always updated
pushd %SCRIPTS%
call EXTRACT_FIXME_%ISO%_%LGU%.bat
popd

pushd %MAPERITIVE%
maperitive "%cd%\Scripts\load_%ISO%_%LGU%_crisis.mscript"