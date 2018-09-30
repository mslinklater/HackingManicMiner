/// @description Insert description here
// You can write your code in this editor

CreateGraphics();

var lev = levels[CurrentLevel];
var tilemap = lev.tilemap;
var index = 0;
for(var yy=0; yy<16; yy++)
{
	for(var xx=0; xx<32; xx++)
	{
		var block = tilemap[index++];
		draw_surface_part(global.tile_surface, block*8, CurrentLevel*8,8,8,xx*8,yy*8);
	}
}