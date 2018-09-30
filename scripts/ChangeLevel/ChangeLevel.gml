/// @description Delete the old level, and init the new one.
/// @param index Level number to change to

// Destroy ALL current platforms
with(oPlatform) instance_destroy();

// Now create new ones based on the level we're changing to
// First get the level container
var level = levels[argument0];

// Loop over the tilemap and create blocks where it isn't empty
var tilemap = level.tilemap;
for(var yy=0 ; yy<16 ; yy++)
{
	for(var xx=0 ; xx<32 ; xx++)
	{
		var block = tilemap[xx+(yy*32)];
//		if((block&7) != 0)
//		{
//			instance_create_depth(xx*8, yy*8, 0, oPlatform);
//		}
	}
}
