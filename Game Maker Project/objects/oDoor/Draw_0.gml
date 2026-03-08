var _c1 = c_white;
var alp = 1;

if(butt) _c1 = c_red;
else if(key) _c1 = c_purple;
else _c1 = c_white;

if (befOp) alp = 0.5;
else alp = 1;

/*if(open) draw_sprite_ext(sprDoor, 0, x, y, image_xscale, image_yscale, image_angle, _c1, 0.3);
else */draw_sprite_ext(sprDoor, 0, x, y, image_xscale, image_yscale, image_angle, _c1, alp);
/* */
/*  */
