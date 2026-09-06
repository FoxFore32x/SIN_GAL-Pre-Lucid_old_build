// toggle fullscreen
if (keyboard_check_pressed(vk_f8)) {
    window_set_fullscreen(!window_get_fullscreen());
}

// find camera target
var _target = noone;

// prefer human players
with (oPlayer) {
    if (player >= 0 && !dead) {
        _target = id;
        break;
    }
}

// fallback to any alive player
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

// camera logic
var _camWidth  = __view_get( e__VW.WView, 0 );
var _camHeight = __view_get( e__VW.HView, 0 );

if(count > 0){
	var desiredLookX = xSpd * lookDist;
	var desiredLookY = ySpd * 10;

	lookX = lerp(lookX, desiredLookX, 0.06);
	lookY = lerp(lookY, desiredLookY, 0.01);

	scrollX += scrollSpdX * god.gameSpeed;
	scrollY += scrollSpdY * god.gameSpeed;
	targetX = scrollX +  totalX / count + lookX;
	targetY = scrollY + totalY / count + lookY;
	
	setCamX = targetX;
	setCamY = targetY;
	
	// cal group size
	var playersW = right - left;
	var playersH = bottom - top;
	
	playersW += 128;
	playersH += 128;
	
	// determine req zoom
	var zoomX = playersW / view_w;
	var zoomY = playersH / view_h;
	
	camZoomTarget = max(zoomX, zoomY);
	
	// limits
	camZoomTarget = clamp(camZoomTarget, 1, 3);
	
	// smoothing
	camZoom = lerp(camZoom, camZoomTarget, 0.1);
}

var camW = view_w * camZoom;
var camH = view_h * camZoom;

var _camX = setCamX - camW  / 2;
var _camY = setCamY - camH / 2;

// clamp to room
_camX = clamp(_camX, 0, room_width  - camW);
_camY = clamp(_camY, 0, room_height - camH);

// smooth camera
finalCamX += (_camX - finalCamX) * camTrailSpd;
finalCamY += (_camY - finalCamY) * camTrailSpd;

var _camX1 = camera_get_view_x(view_camera[0]);

switch(room){
	case ts_7:
		scrollBGSpdX[0] = 15;
		scrollBGSpdY[0] = 0;
		scrollBGSpdX[1] = 7.5;
		scrollBGSpdY[1] = 0;
	break;
	
	default:
		for(var i = 0; i < 10; i++){
			scrollBGSpdX[i] = 0;
			scrollBGSpdY[i] = 0;
		}
	break;
}

for(var i = 0; i < 10; i++){
	
	var layerName = "BG" + string(i);

    if (!layer_exists(layerName))
        continue;
	
	scrollBGX[i] += scrollBGSpdX[i] * god.gameSpeed;
	scrollBGY[i] += scrollBGSpdY[i] * god.gameSpeed;
	
	var lay_id = layer_get_id(layerName);
	var back_id = layer_background_get_id(lay_id);
	var backW = sprite_get_width(layer_background_get_sprite(back_id));
	var backH = sprite_get_height(layer_background_get_sprite(back_id));

	if(scrollBGX[i] > backW || (backW < 0 && (scrollBGX[i] < backW))) scrollBGX[i] = 0;
	if(scrollBGY[i] > backH || (backH < 0 && (scrollBGY[i] < backH))) scrollBGY[i] = 0;
	
	var divider = 1;
	
	if (i == 0) divider = 1;
	else divider = i + 1;
	
	layer_x(layerName, scrollBGX[i] + backLayer_xOff + finalCamX * 0.5 / divider);
	layer_y(layerName, scrollBGY[i] + backLayer_yOff + finalCamY * 0.5 / divider);

}

// apply view position
__view_set(e__VW.WView, 0, camW);
__view_set(e__VW.HView, 0, camH);
__view_set( e__VW.XView, 0, finalCamX );
__view_set( e__VW.YView, 0, finalCamY );
