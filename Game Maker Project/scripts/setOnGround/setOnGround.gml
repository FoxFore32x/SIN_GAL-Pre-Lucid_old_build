function setOnGround(argument0) {
	if (argument0 == true){
	    onGround = true;
	    airDash = false;
	    canWallGrab = true;
	    isWallGrabbing = false;
	    wallGrabTimer = -1;
	    wallGrabLock = 0;
	    coyoteHangTimer = coyoteHangFrames;
	} else {
	    if (canJump) canJump = false;
	    onGround = false;
	    if(ySpeed < 0) coyoteHangTimer = 0;
	}



}
