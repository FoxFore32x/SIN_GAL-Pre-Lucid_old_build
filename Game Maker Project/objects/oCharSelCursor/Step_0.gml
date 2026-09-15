xMov = (global.keyRight[player] - global.keyLeft[player]) * spd;
yMov = (global.keyDown[player] - global.keyUp[player]) * spd;

x += xMov;
y += yMov;

var token = instance_place(x, y, oCharToken);

if (global.keyJump2[player] && token != noone){
	token.isGrabbed = !token.isGrabbed;
}

if(global.keyLight2[player] && instance_exists(oCharToken)){
	var pl = player;
	with(oCharToken){
		if(player == pl) isGrabbed = false;
	}
}