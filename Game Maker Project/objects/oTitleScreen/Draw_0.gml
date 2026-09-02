//DRAW TITLE
draw_set_font(FOT);
var _c1 = c_white;
var _c2 = make_color_rgb(0, 183, 235);
draw_text_transformed_colour(180,20,string_hash_to_newline(string_hash_to_newline("Feltree Forestk Presents:")), 0.2, 0.2, 0, _c2, _c2, _c2, _c2, 1);
draw_text_transformed_colour(100,42,string_hash_to_newline(string_hash_to_newline("SIN_GAL: Pre-Lucid")), 0.4167, 0.4167, 0, _c1, _c1, _c1, _c1, 1);

draw_text_transformed_colour(200,300,string_hash_to_newline(string_hash_to_newline("Credits: " + string(global.credits))), 0.4167, 0.4167, 0, _c1, _c1, _c1, _c1, 1);

