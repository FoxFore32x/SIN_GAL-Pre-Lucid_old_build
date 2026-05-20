pl_freeze();

if (place_meeting(x, y, oPlayer))
{
	var nearest = noone;
	var nearestDist = room_width;

	with (oPlayer) {
		if (id != other.id) {
			var dist = point_distance(other.x, other.y, x, y);
			if (dist < nearestDist) {
				nearestDist = dist;
				nearest = id;
			}
		}
	}

	player = nearest;
	if (player == noone) exit;
	
	if (player.isWallGrabbing == true){
		if(activeAll){
			with(oWallTrain) active = true;
		} else active = true;
		
		player.jPotent = 2;
	} else {
		player.jPotent = 1;
	}
}