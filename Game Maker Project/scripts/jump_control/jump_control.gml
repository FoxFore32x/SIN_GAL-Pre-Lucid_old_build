function jump_control() {
		//variable jump height
		if(!jump && ySpeed < 0){
		    ySpeed *= 0.75;
		}

		//hangtime
		if(jumpHold && abs(ySpeed) < 1){
		    gSpeed = gSpeedDefault * 0.50;
		}else{
		    gSpeed = gSpeedDefault;
		}
	
		/*if (ySpeed == 0 && (place_meeting( x, y+1, parentBlocker ) 
		    || (place_meeting( x, y+1, parentJumpthru )
			&& !place_meeting( x, y, parentJumpthru )))) {
			canJump = true;
			isJump = false;
		}*/
		
		if (coyoteJumpTimer > 0){
			canJump = true;
			isJump = false;
		}

}
