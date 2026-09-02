// Visible area depending on room
if (room == rm_menu || room == results || room == init) {
    view_w = 640;
    view_h = 480;
} else {
    view_w = 640;
    view_h = 480;
}

foreLayer_xOff = layer_get_x("Backgrounds_1");
foreLayer_yOff = layer_get_y("Backgrounds_1");
backLayer_xOff = layer_get_x("Background");
backLayer_yOff = layer_get_y("Background");

room_speed = 60;

// Enable views
view_enabled = true;
__view_set( e__VW.Visible, 0, true );

// View size (camera size)
__view_set( e__VW.WView, 0, view_w );
__view_set( e__VW.HView, 0, view_h );

// Viewport (screen size)
__view_set( e__VW.WPort, 0, 640 );
__view_set( e__VW.HPort, 0, 480 );
__view_set( e__VW.XPort, 0, 0 );
__view_set( e__VW.YPort, 0, 0 );

// Window size
window_set_size(640, 480);

// Snap camera to player at room start
var _target = instance_find(oPlayer, 0);
if (_target != noone && !_target.dead) {
    var _camX = _target.x - __view_get( e__VW.WView, 0 ) / 2;
    var _camY = _target.y - __view_get( e__VW.HView, 0 ) / 2;

    _camX = clamp(_camX, 0, room_width  - __view_get( e__VW.WView, 0 ));
    _camY = clamp(_camY, 0, room_height - __view_get( e__VW.HView, 0 ));

    finalCamX = _camX;
    finalCamY = _camY;

    __view_set( e__VW.XView, 0, finalCamX );
    __view_set( e__VW.YView, 0, finalCamY );
}
