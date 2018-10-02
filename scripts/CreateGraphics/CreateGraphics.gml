/// @description Create the graphics we need

if(!surface_exists(global.tile_surface))
{
	global.tile_surface = surface_create(8*8, 8*20);
	
	surface_set_target(global.tile_surface);
	draw_clear_alpha(0,0);
	
	// Loop through all 20 levels
	for(var lev=0; lev<20; lev++)
	{
		// Get the blocks for THIS level
		var blocks = levels[lev].blocks;
		var att = levels[lev].attrib;
		
		for(var blk=0; blk<8; blk++)
		{
			// base of the binary bitmap for this block
			var xx = blk*8;
			var bright = ((att[blk]>>3)&8);
			var paper = GetColour( bright | ((att[blk]>>3)&$7));
			var ink = GetColour( bright | (att[blk]&$7));
			
			for(var yy=0; yy<8; yy++)
			{
				// get a row of pixels, and then do 8 pixels per byte
				var row = blocks[(blk*8)+yy];
				for(var xi=7; xi>=0; xi--)
				{
					if(((row>>xi)&1)!=0)
					{
						if(((row>>xi)&1)!=0)
						{
							draw_point_color(xx+xi,yy+(lev*8), ink);
						}
						else
						{
							draw_point_color(xx+xi,yy+(lev*8), paper);
						}
					}
				}
			}
		}
	}
	surface_reset_target();
}
//draw_surface(global.tile_surface, 10, 10);

// Init pickup surface
if(!surface_exists(global.item_graphic))
{
	global.item_graphic = surface_create(8,8*20);
    surface_set_target(global.item_graphic);
    draw_clear_alpha(0,0);

    for(var lev=0;lev<20;lev++)
    {
        var itg = levels[lev].item_graphic;
        for(var yy=0;yy<8;yy++)
        {
            var row = itg[yy];
            for(var xi=0;xi<=8;xi++)
            {
                if( ( (row>>xi)&1)!=0 ){
                    draw_point_color(7-xi,yy+(lev*8),$ffffff);
                }
            }
        }   
    }   
    surface_reset_target(); 
}

// guardians
if(!surface_exists(global.guardian_graphics))
{
    global.guardian_graphics = surface_create(8*16,16*20);

    surface_set_target(global.guardian_graphics);
    draw_clear_alpha(0,0);

    for(var lev=0;lev<20;lev++)
    {
        var blocks = levels[lev].Guardians;
        // 8 frames
        for(var i=0;i<8;i++)
        {
            draw_set_alpha(1);

            var xx = (i*16);
            for(var yy=0;yy<16;yy++)
            {
                var row = blocks[(i*16)+yy];
                for(var xi=15;xi>=0;xi--)
                {
                    if( ( (row>>xi)&1)!=0 ){
                        draw_point_color(xx+xi,yy+(lev*16),$ffffff);
                    }
                }
            }
        }
    }
    surface_reset_target();
}

// Init Willy !
if(!surface_exists(global.willy_graphic))
{
	global.willy_graphic = surface_create(16,16*8);
    surface_set_target(global.willy_graphic);
    draw_clear_alpha(0,0);

    // 8 sprites to convert
    for(var spr=0;spr<8;spr++)
    {
        for(var yy=0;yy<16;yy++)
        {
            var row = Willy[yy+(16*spr)];
            for(var xi=0;xi<=16;xi++)
            {
                if( ( (row>>xi)&1)!=0 ){
                    draw_point_color(15-xi,yy+(16*spr),$ffffff);
                }
            }
        }   
    }   
    surface_reset_target();
}

// Portal graphics
if(!surface_exists(global.Portal_Graphic))
{
    global.Portal_Graphic = surface_create(16,16*20);
    surface_set_target(global.Portal_Graphic);
    draw_clear_alpha(0,0);

    for(var lev=0;lev<20;lev++)
    {
        draw_set_alpha(1);
        att = levels[lev].portal_attrib;
        var paper = GetColour((att>>3)&$7);
        var ink   = GetColour(att&$7);

        var block = levels[lev].Portal_Graphic;
        for(var yy=0;yy<16;yy++)
        {
            var row = block[yy];
            for(var xi=15;xi>=0;xi--)
            {
                if( ( (row>>xi)&1)!=0 ){
                    draw_point_color(xi,yy+(lev*16),ink);
                }else{
                    draw_point_color(xi,yy+(lev*16),paper);
                }
            }
        }
    }
    surface_reset_target(); 
}