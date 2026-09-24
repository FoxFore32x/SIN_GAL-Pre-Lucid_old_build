//DRAW TITLE
_videoData = video_draw();
_videoStatus = _videoData[0];

draw_set_font(FOT);
var _c1 = c_white;
var _c2 = make_color_rgb(0, 183, 235);

switch (section){
	case 0:
		draw_sprite_ext(bgLogos, 0, 0, 0, 1, 1, 0, c_white, 1);
	break;
	case 1:
		if(_videoStatus == 0){
			draw_surface(_videoData[1], 0, 0);
		}
	break;
	case 2:
		draw_text_transformed_colour(180,20,string_hash_to_newline(string_hash_to_newline("Feltree Forestk Presents:")), 0.2, 0.2, 0, _c2, _c2, _c2, _c2, 1);
		draw_text_transformed_colour(100,42,string_hash_to_newline(string_hash_to_newline("SIN_GAL: Pre-Lucid")), 0.4167, 0.4167, 0, _c1, _c1, _c1, _c1, 1);
	break;
	case 3:
		if(creditTxtTimer > 50) draw_text_transformed_colour(300,20,string_hash_to_newline(string_hash_to_newline("Demo")), 0.2, 0.2, 0, _c2, _c2, _c2, _c2, 1);
	break;
	
}

draw_set_color(c_black);
draw_set_alpha(fadeLevel);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(1);

if(creditTxtTimer > 50) draw_text_transformed_colour(260,400,string_hash_to_newline(string_hash_to_newline("Credits: " + string(global.credits))), 0.2, 0.2, 0, _c2, _c2, _c2, _c2, 1);

if(debug){
	draw_set_font(FONT_builtin);
	draw_text_colour(450,32,string_hash_to_newline("fadeLevel = " + string(fadeLevel)), _c2, _c2, _c2, _c2, 1);
}