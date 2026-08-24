function pl_grabState(){
	if(grabDur > 0) grabDur -= 1 * god.gameSpeed;
	
	if(up || down) grabDirY = ((down && !downHold) - (up && !upHold));
	if(left || right) grabDirX = (right && !rightHold) - (left && !leftHold);
	
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
		
		if(otherPlayer.hit == false){
			otherPlayer.hitStun = grabStun;
			otherPlayer.xSpeed = grabDirX;
			otherPlayer.ySpeed = grabDirY;
			otherPlayer.hp -= grabDam;
			
			otherPlayer.hit = true;
		}
	}
	
	if(grabDur <= 0){
		state_reset();	
	}
}