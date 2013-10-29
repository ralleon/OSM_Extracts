@ECHO OFF
cd /d %~dp0
pushd ..
set OSM=%cd%
set UTIL=%OSM%\utilities
set SCRIPTS=%OSM%\scripts
set SOURCE=%OSM%\source
set POLY=%OSM%\bounding_poly
set POI=%OSM%\poi_extracts

rem BACKUP FILE should the current download fail
move "%SOURCE%\philippines-latest.osm.pbf" "%SOURCE%\philippines-latest.osm.pbf.bak"

rem DOWNLOAD from GEOFABRIK
rem Note:	if you start (then terminate) the download process, 
rem			this automatically erases existing "philippines-latest.osm.pbf" 
rem			to give you a hint to restore "philippines-latest.osm.pbf.bak"
pushd %UTIL%
wget http://download.geofabrik.de/asia/philippines-latest.osm.pbf -O "%SOURCE%\philippines-temporary.tmp"
move "%SOURCE%\philippines-temporary.tmp" "%SOURCE%\philippines-latest.osm.pbf"

rem CONVERT pbf to osm format
set INPUT="%SOURCE%\philippines-latest.osm.pbf"
set OUTPUT="%SOURCE%\philippines-latest.osm"
osmconvert -v %INPUT% -o=%OUTPUT%
popd