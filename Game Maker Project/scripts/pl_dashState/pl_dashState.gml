function pl_dashState() {
	// Zero out ySpeed and gradually slow down xSpeed
	if (!willDash) {
	    dashAnt -= 1 * god.gameSpeed;

	    if (dashAnt <= 0) {
	        var movingHoriz = (left || right);
	        var idle = (!up && !down && !movingHoriz);

	        // Horizontal movement
	        if (movingHoriz || idle) {
	            xSpeed = dashHSpeed * facing;
	            cxHit = 3 * facing;
	        } else {
	            cxHit = 0;
	        }

	        // Vertical movement
	        if (up) {
	            ySpeed = -dashYSpeed;
	            cyHit = -3.5;
	        } else if (down && !onGround) {
	            ySpeed = dashYSpeed;
	            cyHit = 3.5;
	        } else {
	            ySpeed = 0;
	            cyHit = -2.5;
	        }

	        if(airDash == false) play_sfx(sfxDash, 1, 0);
	        airDash = true;
	        willDash = true;
	    }

	} else {
	    // Gradually approach zero velocity
	    ySpeed = approach(ySpeed, 0, 0.5 * god.gameSpeed);

	    // Simplified xSpeed slowdown
	    if (abs(xSpeed) >= 1 || (xSpeed == 0 && (!up || !down))) {
	        xSpeed = approach(xSpeed, 0, 0.5 * god.gameSpeed);
	    }

	    // Hitbox creation timing
	    if (dashDur >= dashDurMax){
	        invFrames = 6;
	        hitbox_create(-2 * facing*(global.sprScale), -16*(global.sprScale), 26 * facing*(global.sprScale), 10*(global.sprScale), 6, cxHit*(global.sprScale), cyHit*(global.sprScale), 15, 3);
	    }

	    // Reset temporary speed near end
	    if (dashDur <= 2)
	        tSpeed = 0;

	    // Countdown and reset state
	    dashDur -= 1 * god.gameSpeed;
	    if (dashDur <= 0 || (jumpKeyBuffered || lattKeyBuffered || hattKeyBuffered)) {
	        xSpeed /= 1.3;
	        ySpeed /= 1.3;
	        dashDur = 0;
	        dashAnt = dashAntLimit;
	        willDash = false;
	        tSpeed = 10 * (global.sprScale);
	        isDash = false;
	        state_reset();
	    }
	}




}
