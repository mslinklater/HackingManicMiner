game = buffer_load(argument0);

SNA_HeaderSize = 27;

level_base_address = (45056 - 16384) + SNA_HeaderSize;

// 20 levels in Manic Miner
levels = array_create(20);

for(var i = 0; i < 20; i++)
{
	var base_address = level_base_address+(1024*i);
	var level = instance_create_depth(0,0,0,oLevel);
	levels[i] = level;
	level.visible = false;

	// Read the block graphics
	var add = base_address+544;
	var blocks = [];
	var attrib = [];
	var index = 0;
	for(var blk = 0; blk < 8; blk++)
	{
		attrib[blk] = buffer_peek(game, add++, buffer_u8);
		for( var b=0; b<8; b++)
		{
			blocks[index++] = buffer_peek(game, add++, buffer_u8);
		}
	}
	level.attrib = attrib;
	level.blocks = blocks;
	
	global.tile_surface = -1;	// can this go at the end ?
	
	// Get the tilemap layout
	add = base_address;
	var tilemap = array_create(16*32);
	
	for(var yy = 0; yy < 16; yy++)
	{
		for(var xx = 0; xx<32 ; xx++)
		{
			var block = buffer_peek(game, add++, buffer_u8);
			var found = false;
			for(var bb=0; bb<8; bb++)
			{
				if(attrib[bb]==block)
				{
					block = bb;
					found = true;
					break;
				}
			}
			tilemap[xx+(yy*32)] = block;			
		}
	}
	level.tilemap = tilemap;
	
	// read name
	var add = base_address+512;
	var name = "";
	for(var n=0; n<32; n++)
	{
		name = name + ansi_char((buffer_peek(game,add++,buffer_u8)));
	}
	level.name = name;
	show_debug_message(name);
	
	// get items
	var add = base_address+629;
	items = 0;
	// set items to invalid (-1)
	for(var p=0; p<5; p++) items[p] = -1;
	for(var b=0; b<5; b++)
	{
		var item = [];
		var a = buffer_peek(game, add, buffer_u8);
		if(a != 255)
		{
			item[0] = (a&7);	// colour
			a = buffer_peek(game, add+1, buffer_u16);
			item[1] = (a&31)*8;	// x
			item[2] = ((a>>5)&$f)*8;	// y start
			add += 5;
			items[b] = item;
		}
		else
		{
			break;
		}
	}
	level.items = items;
	
	// Get the item graphics
	var add = base_address+692;
	var it = [];
	for(var g=0; g<8; g++)
	{
		it[g] = buffer_peek(game, add++, buffer_u8);
	}
	level.item_graphic = it;
	global.item_graphic = -1;	// set to invalid surface, which forced the render
}


