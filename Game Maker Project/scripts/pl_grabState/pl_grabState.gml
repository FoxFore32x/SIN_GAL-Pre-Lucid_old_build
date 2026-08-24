function pl_grabState(){
	if(grabDur > 0) grabDur -= 1 * god.gameSpeed;
	
	xSpeed = 0;
	ySpeed = 0;
	
	if(grabDur <= 0){
		canJump = true;
		hasSAttWhJump = false;
		canWallGrab = true;
		isPlayerGrabbed = false;
		if(ds_list_size(ignoreList) != 0) ds_list_destroy(ignoreList);
		state_reset();	
	}
}