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
rem -------------------
set ISO=ceb
set LGU=
rem -------------------

rem This ensures that fixme-extract-file is always updated
rem pushd %SCRIPTS%
rem call EXTRACT_FIXME_%ISO%_%LGU%.bat
rem popd

pushd %MAPERITIVE%
maperitive "%cd%\Scripts\load_%ISO%_%LGU%_crisis.mscript"