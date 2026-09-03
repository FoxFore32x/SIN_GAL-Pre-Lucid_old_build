// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function trigTrackerTrain(xChange, yChange, xPos, yPos){
	if (!triggered && place_meeting(x, y, oPlayer))
	{
	    triggered = true;
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

		var player = nearest;
		if (player == noone) exit;
	
		var spawnX;
		var spawnY;

		// X position
		if (xChange)
			spawnX = xPos;
		else
			spawnX = player.x;

		// Y position
		if (yChange)
			spawnY = yPos;
		else
			spawnY = player.y - 128;

		createTrain(spawnX, spawnY, 0, 0, 0.5, 0.5, 0, 60, 200, 5, -30, true);
	}
	
	if(!instance_exists(oTrain)) triggered = false;
}