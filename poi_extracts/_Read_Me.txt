Clicking on any extract_*.bat in the ..\scripts folder 
will create 4 files format:

1. <townname>_poi_<poi_name>.csv for importing and viewing in spreadsheet form (eg. LAT,LONG,NAME,etc)

2. <townname>_poi_<poi_name>.kml for loading and viewing in google earth

3. <townname>_poi_<poi_name>.osm for use by Maperitive renderer (all converted to nodes only)

4. update_<iso>_<townname>_<poi>.osm (polygon/nodes poi raw-extract) for batch-editing in JOSM editor
	
 ========================================================================
	sample technique on batch editing:
		Load update_ADDRESS_TAGS_<iso>_<lgu>.osm to JOSM
		DO NOT USE <CTRL-A>!!! because you'll include "untagged nodes" (all nodes in the polygon)
		Instead: use <CRTL-F>; on Search String, type "-untagged"
		File-Update-Selection <CTRL><ALT>-U 
		--- this downloads the target-objects' up-to-the-minute version from server (to minimize conflict)
		Start Editing (eg. addr:province or addr:city or addr:postcode or deleting addr:state etc)
		Click Upload button
 ========================================================================			
