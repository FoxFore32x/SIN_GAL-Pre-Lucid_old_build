var op_length = array_length_2d(option, menu_level);
//DRAW TITLE
var _c1 = c_white;
draw_text_transformed(180,20,string_hash_to_newline(string_hash_to_newline(string_hash_to_newline("Feltree Forestk Presents:"))), 0.2, 0.2, 0);
draw_text_transformed_colour(100,42,string_hash_to_newline(string_hash_to_newline(string_hash_to_newline("SIN_GAL: Pre-Lucid"))), 0.4167, 0.4167, 0, _c1, _c1, _c1, _c1, 1);

var _new_w = 0;
var text_scale = 0.3333;

for (var i = 0; i < op_length; i++) {
    var _op_w = string_width(string_hash_to_newline(string_hash_to_newline(option[menu_level, i]))) * text_scale;
    _new_w = max(_new_w, _op_w);
}
width = _new_w*1.4 + op_border * 2;
height = op_border*2 + font_get_size(FOT) + (op_length-1)*op_space;

draw_nine_slice(sprMenu_test, x, y, width, height, 2, true, true);
draw_set_font(global.font_main);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

x = __view_get( e__VW.XView, 0 ) + __view_get( e__VW.WView, 0 ) / 2 - width  / 2;
y = __view_get( e__VW.YView, 0 ) + __view_get( e__VW.HView, 0 ) / 2 - height / 2;

for(var i = 0; i < op_length; i++){
    var _c = c_white;
    if(pos == i){ _c = c_yellow};
    draw_text_transformed_colour(x+op_border, y+op_border + op_space*i, string_hash_to_newline(string_hash_to_newline(option[menu_level, i])), 0.3333, 0.3333, 0, _c, _c, _c, _c, 1);
}

if(menu_level == 1){
    for(var i = 0; i < val_length; i++){
        var _c = c_white;
        if(pos == i){ _c = c_red};
        draw_text_transformed_colour(x+_new_w*1.3, y+op_border + op_space*i, string_hash_to_newline(string_hash_to_newline(settVal[i])), 0.3333, 0.3333, 0, _c, _c, _c, _c, 1);
    }
}
