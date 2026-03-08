function pl_tumbleState() {
	//slow horizontal speed

	if(onGround){
	    xSpeed = approach(xSpeed,0,0.1 * god.gameSpeed);
	}else{
	    xSpeed = approach(xSpeed,0,0.01 * god.gameSpeed);
	}

	if (atFloatTim > 0){
	    if(atFloatTim >= 15) atFloatTim = 0;
	    tSpeed = 0;
	    atFloatTim -= 1 * god.gameSpeed;
	} else {
	    tSpeed = 10 * (global.sprScale);
	}

	if((jumpKeyBuffered || lattKeyBuffered || hattKeyBuffered) && !dead){
	    hitStun -= 15;
	    squash_stretch(1.3,0.7);
	}

	if((jump || lowAt) && hitStun <= 3){
	    unTumbled = true;
	}

	//count down your hitStun until it reaches 0
	if(!dead){
	    hitStun -= 1 * god.gameSpeed;
	    if(hitStun <= 0){
	        if(unTumbled == true){
	            invFrames = 20;
	        }
	        unTumbled = false;
	        state_reset();
	    }
	}




}
