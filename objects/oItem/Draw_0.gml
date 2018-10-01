/// @description Draw the item graphic
if( global.item_graphic!=-1){
    colour = ((colour+1)&$f);
    draw_surface_part_ext(global.item_graphic,0,oController.CurrentLevel*8,8,8, x,y,1,1,GetColour(colour>>1),1);
}