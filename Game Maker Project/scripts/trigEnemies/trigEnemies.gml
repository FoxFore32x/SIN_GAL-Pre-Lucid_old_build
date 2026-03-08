function trigEnemies(argument0, argument1, argument2) {
	if (!triggered && place_meeting(x, y, oPlayer))
	{
	    triggered = true;
	    createEnemie(argument0, argument1, argument2);
	}




}
