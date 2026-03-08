// Toggle fullscreen
if (keyboard_check_pressed(vk_f8)) {
    window_set_fullscreen(!window_get_fullscreen());
}

// Find camera target
var _target = noone;

// Prefer human players
with (oPlayer) {
    if (player >= 0 && !dead) {
        _target = id;
        break;
    }
}

// Fallback to any alive player
if (_target == noone) {
    with (oPlayer) {
        if (!dead) {
            _target = id;
            break;
        }
    }
}

// If still no target, stop
if (_target == noone) exit;

// --- CAMERA LOGIC ---
var _camWidth  = __view_get( e__VW.WView, 0 );
var _camHeight = __view_get( e__VW.HView, 0 );

var _camX = _target.x - _camWidth  / 2;
var _camY = _target.y - _camHeight / 2;

// Clamp to room
_camX = clamp(_camX, 0, room_width  - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

// Smooth camera
finalCamX += (_camX - finalCamX) * camTrailSpd;
finalCamY += (_camY - finalCamY) * camTrailSpd;

// Apply view position
__view_set( e__VW.XView, 0, finalCamX );
__view_set( e__VW.YView, 0, finalCamY );
