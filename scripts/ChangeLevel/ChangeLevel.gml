/// @description Delete the old level, and init the new one.
/// @param index Level number to change to

// Destroy ALL current items
with(oItem) instance_destroy(id);

// Now create new ones based on the level we're changing to
// First get the level container
var level = levels[argument0];

// Loop over the tilemap and create blocks where it isn't empty
var items = level.items;
for(var i=0 ; i<5 ; i++)
{
	var item = items[i];
	if(item == -1) break;
	
	var iItem = instance_create_depth(0,0,-100,oItem);
	iItem.x = item[1];
	iItem.y = item[2];
}
