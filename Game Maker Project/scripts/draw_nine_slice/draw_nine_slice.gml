/// @description  draw_nine_slice(sprite, x, y, width, height, border, selected, invert)
/// @param sprite
/// @param  x
/// @param  y
/// @param  width
/// @param  height
/// @param  border
/// @param  selected
/// @param  invert
/// Recreates GM2's Highlight and Inverted Highlight slice modes.
///
/// sprite  = source image
/// x, y    = draw position (top-left)
/// width, height = total draw size
/// border  = border thickness
/// selected = true if this slice is highlighted
/// invert = true for "inverted highlight" (center ↔ edges swap)
function draw_nine_slice(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var spr     = argument0;
	var xx      = argument1;
	var yy      = argument2;
	var ww      = argument3;
	var hh      = argument4;
	var b       = argument5;
	var sel     = argument6;
	var invert  = argument7;

	var sw = sprite_get_width(spr);
	var sh = sprite_get_height(spr);

	var iw = sw - b * 2; // inner source width
	var ih = sh - b * 2; // inner source height
	var tw = ww - b * 2; // target inner width
	var th = hh - b * 2; // target inner height

	// colors
	var col_highlight = make_color_rgb(255, 255, 160);
	var col_normal    = c_white;

	// for inversion logic
	var center_src_x = b;
	var center_src_y = b;
	var edges_col = col_normal;
	var center_col = col_highlight;

	// --- logic for invert & selection ---
	if (invert) {
	    // Inverted mode = flip highlight zones
	    if (sel) {
	        center_col = col_normal;
	        edges_col  = col_highlight;
	    } else {
	        center_col = col_highlight;
	        edges_col  = col_normal;
	    }
	} else {
	    // Normal mode
	    if (sel) {
	        center_col = col_highlight;
	        edges_col  = col_normal;
	    } else {
	        center_col = col_normal;
	        edges_col  = col_highlight;
	    }
	}

	// -- CORNERS (no scaling) --
	draw_sprite_part_ext(spr, 0, 0,      0,      b, b,  xx,        yy,        1, 1, edges_col, 1); // TL
	draw_sprite_part_ext(spr, 0, b+iw,   0,      b, b,  xx+ww-b,   yy,        1, 1, edges_col, 1); // TR
	draw_sprite_part_ext(spr, 0, 0,      b+ih,   b, b,  xx,        yy+hh-b,   1, 1, edges_col, 1); // BL
	draw_sprite_part_ext(spr, 0, b+iw,   b+ih,   b, b,  xx+ww-b,   yy+hh-b,   1, 1, edges_col, 1); // BR

	// -- EDGES (stretch one axis) --
	draw_sprite_part_ext(spr, 0, b,      0,      iw, b,  xx+b,      yy,        tw/iw, 1, edges_col, 1); // top
	draw_sprite_part_ext(spr, 0, b,      b+ih,   iw, b,  xx+b,      yy+hh-b,   tw/iw, 1, edges_col, 1); // bottom
	draw_sprite_part_ext(spr, 0, 0,      b,      b,  ih, xx,        yy+b,      1, th/ih, edges_col, 1); // left
	draw_sprite_part_ext(spr, 0, b+iw,   b,      b,  ih, xx+ww-b,   yy+b,      1, th/ih, edges_col, 1); // right

	// -- CENTER (stretched both directions) --
	draw_sprite_part_ext(spr, 0, b, b, iw, ih, xx+b, yy+b, tw/iw, th/ih, center_col, 1);




}
