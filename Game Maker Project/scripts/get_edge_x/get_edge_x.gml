function get_edge_x(dir) {
    if (dir > 0) {
        // right edge
        return x + (sprite_get_bbox_right(sprite_index) - sprite_xoffset) * image_xscale;
    } else {
        // left edge
        return x + (sprite_get_bbox_left(sprite_index) - sprite_xoffset) * image_xscale;
    }
}

function set_targetX(edge, xDirection){
	return abs(edge - get_edge_x(xDirection) - x);
}