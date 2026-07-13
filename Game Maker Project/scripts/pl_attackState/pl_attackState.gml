function pl_attackState() {
	//speed adjustments

	//invFrames = 3;

	loop = false;
	
	if (smallStAtJump){
		if(!smallStAtJumpAct){
			if(attDirX != noone) xSpeed = attDirX;
			if(attDirY != noone) ySpeed = attDirY;
			smallStAtJumpAct = true;
		}
	} else {
		if(attDirX != noone) xSpeed = attDirX;
		if(attDirY != noone) ySpeed = attDirY;
	}

	if(onGround){
	    xSpeed = approach(xSpeed,0.8 * facing,aSpeed * god.gameSpeed);
	}else{
	    xSpeed = approach(xSpeed,0,0.1 * god.gameSpeed);
	}
	
	//ySpeed = approach(ySpeed,0.8,1 * god.gameSpeed);

	//code for each weapon type, and each attack for that weapon
	switch(weapon){    
	    case weapons.sword:
	        sword_attacks();
	    break;
    
	    case weapons.dagger:
	        dagger_attacks();
	    break;
    
	    case weapons.spear:
	        spear_attacks();
	    break;
    
	    /*case weapons.axe:
	        axe_attacks();
	    break;*/
	}

	//landing recovery
	recovery_set();

	//countdown hitbox duration if active
	if(dur > 0){
	    dur -= 1 * god.gameSpeed;
	}else{
	    dur = 0;
	}

	if(chitTimer > 0){
	    chitTimer -= 1 * god.gameSpeed;
	} else {
	    chitTimer = 0;
	}

	//reset to normal state when the attack animation ends
	if(/*animation_end() ||*/ chitTimer == 0){
	    canPlay = true;
		attOnGround = false;
		smallStAtJumpAct = false;
	    state_reset();
	}



}
