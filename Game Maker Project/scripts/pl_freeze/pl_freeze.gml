function pl_freeze(){
	if (freeze > 0) {
	    if (freezeStored == false) { // store ONCE
	        tempXSpeed = xSpeed;
	        tempYSpeed = ySpeed;
	        freezeStored = true;
	    }

	    isFrozen = true;
	    xSpeed = 0;
	    ySpeed = 0;
	    frameSpeed = 0;
	    freeze -= 1 * god.gameSpeed;

	} else {
	    if (isFrozen) { // only restore once when thawing
	        xSpeed = tempXSpeed;
	        ySpeed = tempYSpeed;
	        frameSpeed = 1;
	        freezeStored = false;
	        isFrozen = false;
	    }
	}
}