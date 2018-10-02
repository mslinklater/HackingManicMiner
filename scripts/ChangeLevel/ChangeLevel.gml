/// @description Delete the old level, and init the new one.
/// @param index Level number to change to

// Destroy ALL current items
with(oItem) instance_destroy(id);
with(oHBaddie) instance_destroy(id);

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

// HBaddies
var baddies = level.Hbaddies;
for(var b=0;b<4;b++)
{
    var baddie = baddies[b];
    if( baddie == -1 ) break;

    var iBaddie = instance_create_depth(0,0,-100,oHBaddie);
    iBaddie.sp = baddie[0];
    iBaddie.col = GetColour(baddie[1]);
    iBaddie.x = baddie[2];
    iBaddie.y = baddie[3];
    iBaddie.dir = baddie[4];
    iBaddie.left = baddie[5];
    iBaddie.right = baddie[6];
    iBaddie.sprite = CurrentLevel;
}

// Vertical baddies
with(oVBaddie) instance_destroy(id);
var baddies = level.Vbaddies;
for(var b=0;b<4;b++)
{
    var baddie = baddies[b];
    if( baddie == -1 ) break;

    var iBaddie = instance_create_depth(0,0,-100,oVBaddie);
    iBaddie.col = GetColour(baddie[0]);
    iBaddie.y = baddie[2];
    iBaddie.x = baddie[3];
    iBaddie.sp = baddie[4];
    iBaddie.top = baddie[5];
    iBaddie.bottom = baddie[6];
    iBaddie.dir =0;
    iBaddie.sprite = CurrentLevel;
}

// Miner Willy
with(oPlayer) instance_destroy();
var willy = instance_create_depth(level.WillyX, level.WillyY, -50, oPlayer);
willy.frame = 0;
willy.dir = level.dir;

with(oExit) instance_destroy(id);
var iExit = instance_create_depth(level.portalx,level.portaly,-100,oExit);