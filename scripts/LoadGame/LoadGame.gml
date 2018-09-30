game = buffer_load(argument0);

SNA_HeaderSize = 27;

level_base_address = (45056 - 16384) + SNA_HeaderSize;

// 20 levels in Manic Miner
levels = array_create(20);

for(var i = 0; i < 20; i++)
{
	var base_address = level_base_address+(1024*i);
	var level = instance_create_depth(0,0,0,oLevel);
	level.visible = false;
	
	add = base_address;
	
	var tilemap = array_create(16*32);
	
	for(var yy = 0; yy < 16; yy++)
	{
		for(var xx = 0; xx<32 ; xx++)
		{
			var block = buffer_peek(game, add++, buffer_u8);
			
			tilemap[xx+(yy*32)] = block;
			
//			if(block != 0)
//			{
//				instance_create_depth(xx*8, yy*8, 0, oPlatform);
//			}
		}
	}
//	break;
	level.tilemap = tilemap;
	levels[i] = level;	
}


