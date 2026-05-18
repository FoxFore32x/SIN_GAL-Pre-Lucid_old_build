/// @description trigEnemies(quantity, distance, yPosition, isBoss);
/// @param  quantity
/// @param  distance
/// @param  yPosition
/// @param  isBoss

function trigEnemies(argument0, argument1, argument2, argument3) {
	if (!triggered && place_meeting(x, y, oPlayer))
	{
	    triggered = true;
	    createEnemie(argument0, argument1, argument2, argument3);
	}




}
