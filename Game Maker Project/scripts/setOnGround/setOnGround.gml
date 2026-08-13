function setOnGround(argument0) {
	if (argument0 == true){
	    onGround = true;
	    airDash = false;
		dashed = false;
	    canWallGrab = true;
	    isWallGrabbing = false;
		hasSAttWhJump = false;
		tSpeed = 10 * (global.sprScale);
		jPotent = 1;
		smallStop = false;
	    wallGrabTimer = -1;
	    coyoteHangTimer = coyoteHangFrames
	} else {
	    if (canJump && !isDash) canJump = false;
	    onGround = false;
	    if(ySpeed < 0) coyoteHangTimer = 0;
	}



}
