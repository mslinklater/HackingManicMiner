/// @description Draw and animate a guardian

var frame = 3-((x>>1)&3);
if( dir>=0 ){   
    frame +=4;
}

draw_surface_part_ext(global.guardian_graphics, frame*16, sprite*16,16,16, x&~7,y, 1,1,col,1);