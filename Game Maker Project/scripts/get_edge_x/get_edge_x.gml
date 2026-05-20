function get_edge_x(dir) {
    if (dir > 0) {
        // right edge
        return x + (sprite_get_bbox_right(sprite_index) - sprite_xoffset) * image_xscale;
    } else {
        // left edge
        return x + (sprite_get_bbox_left(sprite_index) - sprite_xoffset) * image_xscale;
    }
}

function set_target(targetEdge, dir) {

    var currentEdge = get_edge_x(dir);

    // amount needed to align edge perfectly
    var offset = targetEdge - currentEdge;

    // return corrected x position
    return x + offset;
}