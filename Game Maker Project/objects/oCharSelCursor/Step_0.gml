xMov = (global.keyRight[player] - global.keyLeft[player]) * spd;
yMov = (global.keyDown[player] - global.keyUp[player]) * spd;

x += xMov;
y += yMov;

keySelect = global.keyJump2[player];
keyDecline = global.keyLight2[player];

var token = instance_place(x, y, oCharToken);

if (keySelect && token != noone){
	if (heldToken == noone){
		heldToken = token;
		token.isGrabbed = true;
	}
	else if (heldToken == token){
		heldToken.isGrabbed = false;
		heldToken = noone;
	}
}

if (keyDecline)
{
	var pl = player;
	var inst = noone;
	with (oCharToken){
		if (player == pl){
			var slot = instance_place(x, y, oCharSlot);
			if(slot != noone){
				if (player < 0) global.cpus--;
				else global.players--;
			}
			inst = id;
			isGrabbed = true;
		}
	}
	if(inst != noone) heldToken = inst;
}