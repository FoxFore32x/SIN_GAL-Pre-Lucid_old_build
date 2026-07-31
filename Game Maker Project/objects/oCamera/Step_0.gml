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

var totalX = 0;
var totalY = 0;
var count = 0;
var targetX = 0;
var targetY = 0;

var left   =  999999;
var right  = -999999;
var top    =  999999;
var bottom = -999999;

var xSpd = 0;
var ySpd = 0;

var lookDist = 70;

with(oPlayer){
	left = min(left, x);
	right = max(right, x);
	top = min(top, y);
	bottom = max(bottom, y);
	
	totalX += x;
	totalY += y;
	xSpd = facing;
	ySpd = ySpeed;
	count++;
}

// If still no target, stop
if (_target == noone) exit;

// --- CAMERA LOGIC ---
var _camWidth  = __view_get( e__VW.WView, 0 );
var _camHeight = __view_get( e__VW.HView, 0 );

if(count > 0){
	var desiredLookX = xSpd * lookDist;
	var desiredLookY = ySpd * 10;

	lookX = lerp(lookX, desiredLookX, 0.06);
	lookY = lerp(lookY, desiredLookY, 0.06);

	targetX = totalX / count + lookX;
	targetY = totalY / count + lookY;
	
	setCamX = targetX;
	setCamY = targetY;
	
	//cal group size
	var playersW = right - left;
	var playersH = bottom - top;
	
	playersW += 128;
	playersH += 128;
	
	//determine req zoom
	var zoomX = playersW / view_w;
	var zoomY = playersH / view_h;
	
	camZoomTarget = max(zoomX, zoomY);
	
	//limits
	camZoomTarget = clamp(camZoomTarget, 1, 3);
	
	//smoothin'
	camZoom = lerp(camZoom, camZoomTarget, 0.1);
}

var camW = view_w * camZoom;
var camH = view_h * camZoom;

var _camX = setCamX - camW  / 2;
var _camY = setCamY - camH / 2;

// Clamp to room
_camX = clamp(_camX, 0, room_width  - camW);
_camY = clamp(_camY, 0, room_height - camH);

// Smooth camera
finalCamX += (_camX - finalCamX) * camTrailSpd;
finalCamY += (_camY - finalCamY) * camTrailSpd;

// Apply view position
__view_set(e__VW.WView, 0, camW);
__view_set(e__VW.HView, 0, camH);
__view_set( e__VW.XView, 0, finalCamX );
__view_set( e__VW.YView, 0, finalCamY );
