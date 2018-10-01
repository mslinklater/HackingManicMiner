/// @description Insert description here
// You can write your code in this editor

LoadGame("manic.sna");
CurrentLevel = 0;
ChangeLevel(CurrentLevel);

var mapping = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]`_£abcdefghijklmnopqrstuvwxyz{|}~^";
zxfont = font_add_sprite_ext(sFont,mapping,0,0);
