/// @description draw hurtbox
_c = c_green;
if(owner.invins) _c = c_blue;
else if(owner.shield > 0) _c = c_yellow;
else _c = c_green;
draw_sprite_ext(sprite_index,0,x,y,xScale,yScale,0,_c,0.75)
