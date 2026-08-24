function pl_grabState(){
	if(grabDur > 0) grabDur -= 1 * god.gameSpeed;
	
	if(up || down) grabDirY = ((down) - (up)) * (5 * global.sprScale);
	else grabDirY = 0;
	
	if(left || right) grabDirX = ((right) - (left)) * (5 * global.sprScale);
	else grabDirX = 0;
	
	var nearest = noone;
	var nearestDist = room_width;

	if (place_meeting(x, y, oPlayer))
	{

		with (oPlayer) {
			if (id != other.id) {
				var dist = point_distance(other.x, other.y, x, y);
				if (dist < nearestDist) {
					nearestDist = dist;
					nearest = id;
				}
			}
		}

		otherPlayer = nearest;
		if (otherPlayer == noone) exit;
		
		if(otherPlayer.grabbed == false){
			otherPlayer.currentState = states.tumble;
			otherPlayer.hitStun = grabStun;
			otherPlayer.xSpeed = grabDirX;
			otherPlayer.ySpeed = grabDirY;
			otherPlayer.hp -= grabDam;
			
			otherPlayer.grabbed = true;
		}
	}
	
	if(grabDur <= 0){
		state_reset();	
	}
}