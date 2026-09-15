xMov = (global.keyRight[player] - global.keyLeft[player]) * spd;
yMov = (global.keyDown[player] - global.keyUp[player]) * spd;

x += xMov;
y += yMov;

var token = instance_place(x, y, oCharToken);

if (global.keyJump2[player] && token != noone){
	token.isGrabbed = !token.isGrabbed;
}

if (global.keyLight2[player])
{
	var pl = player;
	with (oCharToken){
		var slot = instance_place(x, y, oCharSlot);
		if (player == pl){
			if(slot != noone){
				if (player < 0) global.cpus--;
				else global.players--;
			}
			isGrabbed = true;
		}
	}
}