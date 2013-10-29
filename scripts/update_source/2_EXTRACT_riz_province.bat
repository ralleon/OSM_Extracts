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

rem EDIT LGU names for use in file names (small-caps only); leave <blank> for provincial extract
rem http://www.statoids.com/uph.html (for provincial iso-codes)
set ISO=riz
set LGU=

set INPUT="%SOURCE%\philippines-latest.osm.pbf"
set BOUND1="%POLY%\extract_%ISO%_%LGU%.poly"
set OUTPUT1="%SOURCE%\extract_%ISO%_%LGU%.osm"
set BOUND2="%POLY%\map_%ISO%_%LGU%.poly"
set OUTPUT2="%MAPERITIVE%\maps\map_%ISO%_%LGU%.osm"

pushd "%UTIL%" 
osmconvert -v %INPUT% -B=%BOUND1% -o=%OUTPUT1%
osmconvert -v %INPUT% -B=%BOUND2% -o=%OUTPUT2%
rem osmconvert -v --complex-ways --complete-ways %INPUT% -B=%BOUND2% -o=%OUTPUT2%

popd
popd