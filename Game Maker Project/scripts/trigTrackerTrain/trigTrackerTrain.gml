// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function trigTrackerTrain(){
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
	
		createTrain(player.x, player.y, 0, 0, 0.5, 0.5, 0, 10, 400, 5, -30, true);
	}
}