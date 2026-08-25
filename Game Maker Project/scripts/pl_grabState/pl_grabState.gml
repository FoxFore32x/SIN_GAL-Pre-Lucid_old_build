function pl_grabState(){
	if(grabDur > 0) grabDur -= 1 * god.gameSpeed;
	
	xSpeed = 0;
	ySpeed = 0;
	
	if(grabDur <= 0){
		canJump = true;
		hasSAttWhJump = false;
		canWallGrab = true;
		isPlayerGrabbed = false;
		state_reset();	
	}
}