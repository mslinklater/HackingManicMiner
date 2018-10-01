/// @description Insert description here
// You can write your code in this editor

if( dir<0 && x>left) x += dir*(sp+1);
else if( dir>0 && x<right) x += dir*(sp+1);
if( x<=left ) dir = -dir;
else if( x>=right ) dir = -dir;