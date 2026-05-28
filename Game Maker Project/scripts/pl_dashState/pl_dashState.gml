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
		            dashHitX = 4 * facing;
		        } else {
		            dashHitX = 0;
		        }

		        // Vertical movement
		        if (up) {
		            ySpeed = -dashYSpeed;
		            dashHitY = -3.5;
		        } else if (down && !onGround) {
		            ySpeed = dashYSpeed;
		            dashHitY = 3.5;
		        } else {
		            ySpeed = 0;
		            dashHitY = -2.5;
		        }

		        if(airDash == false) play_sfx(sfxDash, 1, 0);
		        airDash = true;
		        willDash = true;
		    }

	} else {
	    // Gradually approach zero velocity
	    if(!custDash){
			ySpeed = approach(ySpeed, 0, 0.5 * god.gameSpeed);

		    // Simplified xSpeed slowdown
		    if (abs(xSpeed) >= 1 || (xSpeed == 0 && (!up || !down))) {
		        xSpeed = approach(xSpeed, 0, 0.5 * god.gameSpeed);
		    }

		    // Hitbox creation timing
		    if (dashDur >= dashDurMax){
		        invFrames = 6;
		        hitbox_create(-2 * facing*(global.sprScale), -16*(global.sprScale), 26 * facing*(global.sprScale), 10*(global.sprScale), 6, dashHitX*(global.sprScale), dashHitY*(global.sprScale), 15, 3,false);
		    }

		    // Reset temporary speed near end
		    if (dashDur <= 2)
		        tSpeed = 0;

		    // Countdown and reset state
		    dashDur -= 1 * god.gameSpeed;
		    if (dashDur <= 0 || (lattKeyBuffered || hattKeyBuffered || jumpKeyBuffered)) {
				if((lattKeyBuffered || hattKeyBuffered || jumpKeyBuffered)) dashCanCldn = dashCanCldnMax;
				if(jumpKeyBuffered && !isJump) canJump = true;
		        xSpeed /= 1.5;
		        ySpeed /= 1.5;
		        dashDur = 0;
		        dashAnt = dashAntLimit;
		        willDash = false;
		        tSpeed = 10 * (global.sprScale);
				if(!isJump) canJump = true;
		        state_reset();
		    }
		}
	}




}
