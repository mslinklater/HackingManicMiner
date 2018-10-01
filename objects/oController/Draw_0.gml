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

// draw level name
draw_set_colour(c_yellow);
draw_rectangle(0,16*8,256,(17*8)-1,false);
draw_set_color(c_black);
draw_set_font(zxfont);
draw_text(0,16*8,lev.name);

// draw air
CurrentAir = 31*8;
draw_set_colour($0000ff);
draw_rectangle(0, 136, 80, 136+8, false);
draw_set_colour($00ff00);
draw_rectangle(80, 136, 256, 136+8, false);
draw_set_color(c_white);
draw_text(0, (17*8), "AIR");
draw_rectangle(32, 136+2, (CurrentAir), 136+6, false);