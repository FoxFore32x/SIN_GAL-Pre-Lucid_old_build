function check_below() {
	//Returns true if the object is standing on solid ground 
	//(including jump-thru platforms), false otherwise.

	//An object is on solid ground if:
	// 1. there is an parentBlocker directly below it
	//  OR
	// 2.   a. there is an parentJumpthru directly below it
	//          AND
	//      b. there is not an parentJumpthru inside it
	
	jumpThru = instance_place( x, y+1, parentJumpthru );
	thruPlat = instance_place( x, y, parentJumpthru );
	
	if(thruPlat && !passTrough){
		y -= 10;
	}

	return place_meeting( x, y+1, parentBlocker ) 
	    || (!passTrough && jumpThru && !thruPlat && sign(ySpeed) != -1);



}
