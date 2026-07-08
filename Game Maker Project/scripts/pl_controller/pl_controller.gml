function pl_controller() {
	
	if(player >= 0){
		//player button inputs
		leftHold  = left;
		rightHold = right;
		upHold    = up;
		downHold  = down;
    
		//left = keyboard_check(ord("A")) || (gamepad_axis_value(global.plInput[player], gp_axislh) < -0.6) || (gamepad_button_check(global.plInput[player], gp_padl));
		left = global.keyLeft[player];

		if (left && !leftHold){
			leftKeyBufferTimer = bufferTime;
		}
		if(leftKeyBufferTimer > 0){
			leftKeyBuffered = 1;
			leftKeyBufferTimer -= 1;
		} else {
			leftKeyBuffered = 0;
		}
    
		//right = keyboard_check(ord("D")) || (gamepad_axis_value(global.plInput[player], gp_axislh) > 0.6) || (gamepad_button_check(global.plInput[player], gp_padr));
		right = global.keyRight[player];

		if (right && !rightHold){
			rightKeyBufferTimer = bufferTime;
		}
		if(rightKeyBufferTimer > 0){
			rightKeyBuffered = 1;
			rightKeyBufferTimer -= 1;
		} else {
			rightKeyBuffered = 0;
		}
    
		//up = keyboard_check(ord("W")) || (gamepad_axis_value(global.plInput[player], gp_axislv) < -0.6) || (gamepad_button_check(global.plInput[player], gp_padu));
		up = global.keyUp[player];

		if (up && !upHold){
			upKeyBufferTimer = bufferTime;
		}
		if(upKeyBufferTimer > 0){
			upKeyBuffered = 1;
			upKeyBufferTimer -= 1;
		} else {
			upKeyBuffered = 0;
		}
    
		//down = keyboard_check(ord("S")) || (gamepad_axis_value(global.plInput[player], gp_axislv) > 0.6) || (gamepad_button_check(global.plInput[player], gp_padd));
		down = global.keyDown[player];

		if (down && !downHold){
			downKeyBufferTimer = bufferTime;
		}
		if(downKeyBufferTimer > 0){
			downKeyBuffered = 1;
			downKeyBufferTimer -= 1;
		} else {
			downKeyBuffered = 0;
		}
		
		left2 = global.keyLeft2[player];
		right2 = global.keyRight2[player];
		up2 = global.keyUp2[player];
		down2 = global.keyDown2[player];
    
		// reset dtaps every frame
		leftDouble  = false;
		rightDouble = false;
		upDouble    = false;
		downDouble  = false;
    
		// left dtap
		if ((left2) && (!right || !up || !down)) {
			if (dt_left_timer > 0) {
				if (left2) leftDouble  = true;
				dt_left_timer = -1;
			} else {
				dt_left_timer = 7;
			}
		}
    
		// right dtap
		if ((right2) && (!left || !up || !down)) {
			if (dt_right_timer > 0) {
				if (right2) rightDouble = true;
				dt_right_timer = -1;
			} else {
				dt_right_timer = 7;
			}
		}
    
		// up dtap
		if ((up2) && (!right || !left || !down)) {
			if (dt_up_timer > 0) {
				if (up2) upDouble = true;
				dt_up_timer = -1;
			} else {
				dt_up_timer = 7;
			}
		}
    
		// down dtap
		if ((down2) && (!right || !up || !left)) {
			if (dt_down_timer > 0) {
				if (down2) downDouble = true;
				dt_down_timer = -1;
			} else {
				dt_down_timer = 7;
			}
		}
    
		jumpHold = jump;
		//jump = keyboard_check(ord("O")) || gamepad_button_check(global.plInput[player], gp_face1);
		//jump2 = keyboard_check_pressed(ord("O")) || gamepad_button_check_pressed(global.plInput[player], gp_face1);
		jump = global.keyJump[player];
		jump2 = global.keyJump2[player];
	
		if (jump && !jumpHold){
			jumpKeyBufferTimer = bufferTime;
		}
		if(jumpKeyBufferTimer > 0){
			jumpKeyBuffered = 1;
			jumpKeyBufferTimer -= 1;
		} else {
			jumpKeyBuffered = 0;
		}
    
		if (jump){
			jumpMantKeyBufferTimer = bufferTime;
		}
		if(jumpMantKeyBufferTimer > 0){
			jumpMantKeyBuffered = 1;
			jumpMantKeyBufferTimer -= 1;
		} else {
			jumpMantKeyBuffered = 0;
		}

		lowAtHold = lowAt;
		//lowAt = keyboard_check(ord("I")) || (gamepad_button_check(global.plInput[player], gp_face3));
		lowAt = global.keyLight[player];
	
		if (lowAt && !lowAtHold){
			lattKeyBufferTimer = bufferTime;
		}
		if(lattKeyBufferTimer > 0){
			lattKeyBuffered = 1;
			lattKeyBufferTimer -= 1;
		} else {
			lattKeyBuffered = 0;
		}
    
		hiAtHold = hiAt;
		//hiAt = keyboard_check(ord("K")) || (gamepad_button_check(global.plInput[player], gp_face4));
		hiAt = global.keyStrong[player];
	
		if(hiAt && !hiAtHold){
			hattKeyBufferTimer = bufferTime;
		}
    
		if(hattKeyBufferTimer > 0){
			hattKeyBuffered = 1;
			hattKeyBufferTimer -= 1;
		} else {
			hattKeyBuffered = 0;
		}
    
		spBtHold = spBt;
		//spBt = keyboard_check(ord("L")) || (gamepad_button_check(global.plInput[player], gp_face2));
		spBt = global.keySpecial[player];
	
		if(spBt && !spBtHold){
			spKeyBufferTimer = bufferTime;
		}
    
		if(spKeyBufferTimer > 0){
			spKeyBuffered = 1;
			spKeyBufferTimer -= 1;
		} else {
			spKeyBuffered = 0;
		}
    
		dashHold = dash;
		//dash = keyboard_check(ord("P")) || (gamepad_button_check(global.plInput[player], gp_shoulderr)) || (gamepad_button_check(global.plInput[player], gp_shoulderrb));
		dash = global.keyDash[player];
 
		if (dash && !dashHold){
			dashKeyBufferTimer = bufferTime;
		}
		if(dashKeyBufferTimer > 0){
			dashKeyBuffered = 1;
			dashKeyBufferTimer -= 1;
		} else {
			dashKeyBuffered = 0;
		}

		parryHold = parry;
		//parry = keyboard_check(vk_shift) || (gamepad_button_check(global.plInput[player], gp_shoulderl)) || (gamepad_button_check(global.plInput[player], gp_shoulderlb));
		parry = global.keyBlock[player];

		if (parry && !parryHold){
			parryKeyBufferTimer = bufferTime;
		}
		if(parryKeyBufferTimer > 0){
			parryKeyBuffered = 1;
			parryKeyBufferTimer -= 1;
		} else {
			parryKeyBuffered = 0;
		}
    
		itemHold = item;
		//item = keyboard_check(vk_shift) || (gamepad_button_check(global.plInput[player], gp_shoulderl)) || (gamepad_button_check(global.plInput[player], gp_shoulderlb));
		item = global.keyBlock[player];
 
		if (item){
			wallKeyBufferTimer = bufferTime;
		}
		if(wallKeyBufferTimer > 0){
			wallKeyBuffered = 1;
			wallKeyBufferTimer -= 1;
		} else {
			wallKeyBuffered = 0;
		}
	
		pauseHold = pause;
		//pause = keyboard_check(ord("1")) || (gamepad_button_check(global.plInput[0], gp_start));
		pause = global.keyPause[player];
	
	} else {
		//player button inputs
		leftHold  = left;
		rightHold = right;
		upHold    = up;
		downHold  = down;
    
		//left = keyboard_check(ord("A")) || (gamepad_axis_value(global.plInput[player], gp_axislh) < -0.6) || (gamepad_button_check(global.plInput[player], gp_padl));
		left = false;

		if (left && !leftHold){
			leftKeyBufferTimer = bufferTime;
		}
		if(leftKeyBufferTimer > 0){
			leftKeyBuffered = 1;
			leftKeyBufferTimer -= 1;
		} else {
			leftKeyBuffered = 0;
		}
    
		//right = keyboard_check(ord("D")) || (gamepad_axis_value(global.plInput[player], gp_axislh) > 0.6) || (gamepad_button_check(global.plInput[player], gp_padr));
		right = false;

		if (right && !rightHold){
			rightKeyBufferTimer = bufferTime;
		}
		if(rightKeyBufferTimer > 0){
			rightKeyBuffered = 1;
			rightKeyBufferTimer -= 1;
		} else {
			rightKeyBuffered = 0;
		}
    
		//up = keyboard_check(ord("W")) || (gamepad_axis_value(global.plInput[player], gp_axislv) < -0.6) || (gamepad_button_check(global.plInput[player], gp_padu));
		up = false;

		if (up && !upHold){
			upKeyBufferTimer = bufferTime;
		}
		if(upKeyBufferTimer > 0){
			upKeyBuffered = 1;
			upKeyBufferTimer -= 1;
		} else {
			upKeyBuffered = 0;
		}
    
		//down = keyboard_check(ord("S")) || (gamepad_axis_value(global.plInput[player], gp_axislv) > 0.6) || (gamepad_button_check(global.plInput[player], gp_padd));
		down = false;

		if (down && !downHold){
			downKeyBufferTimer = bufferTime;
		}
		if(downKeyBufferTimer > 0){
			downKeyBuffered = 1;
			downKeyBufferTimer -= 1;
		} else {
			downKeyBuffered = 0;
		}
    
		// reset flags cada frame
		leftDouble  = false;
		rightDouble = false;
		upDouble    = false;
		downDouble  = false;
    
		// ---------------- LEFT ----------------
		if ((left && !leftHold) && (!right || !up || !down)) {
			if (dt_left_timer > 0) {
				dt_buffer = 1;
				dt_left_timer = -1;
			} else {
				dt_left_timer = 30;
				dt_buffer = 0;
			}
		}
    
		// ---------------- RIGHT ----------------
		if ((right && !rightHold) && (!left || !up || !down)) {
			if (dt_right_timer > 0) {
				dt_buffer = 1;
				dt_right_timer = -1;
			} else {
				dt_right_timer = 30;
				dt_buffer = 0;
			}
		}
    
		// ---------------- UP ----------------
		if ((up && !upHold) && (!right || !left || !down)) {
			if (dt_up_timer > 0) {
				dt_buffer = 1;
				dt_up_timer = -1;
			} else {
				dt_up_timer = 30;
				dt_buffer = 0;
			}
		}
    
		// ---------------- DOWN ----------------
		if ((down && !downHold) && (!right || !up || !left)) {
			if (dt_down_timer > 0) {
				dt_buffer = 1;
				dt_down_timer = -1;
			} else {
				dt_down_timer = 30;
				dt_buffer = 0;
			}
		}
    
		// timers
		if (dt_left_timer  > 0) dt_left_timer  -= 1;
		if (dt_right_timer > 0) dt_right_timer -= 1;
		if (dt_up_timer    > 0) dt_up_timer    -= 1;
		if (dt_down_timer  > 0) dt_down_timer  -= 1;
    
		jumpHold = jump;
		//jump = keyboard_check(ord("O")) || gamepad_button_check(global.plInput[player], gp_face1);
		//jump2 = keyboard_check_pressed(ord("O")) || gamepad_button_check_pressed(global.plInput[player], gp_face1);
		jump = false;
		jump2 = false;
	
		if (jump && !jumpHold){
			jumpKeyBufferTimer = bufferTime;
		}
		if(jumpKeyBufferTimer > 0){
			jumpKeyBuffered = 1;
			jumpKeyBufferTimer -= 1;
		} else {
			jumpKeyBuffered = 0;
		}
    
		if (jump){
			jumpMantKeyBufferTimer = bufferTime;
		}
		if(jumpMantKeyBufferTimer > 0){
			jumpMantKeyBuffered = 1;
			jumpMantKeyBufferTimer -= 1;
		} else {
			jumpMantKeyBuffered = 0;
		}

		lowAtHold = lowAt;
		//lowAt = keyboard_check(ord("I")) || (gamepad_button_check(global.plInput[player], gp_face3));
		lowAt = false;
	
		if (lowAt && !lowAtHold){
			lattKeyBufferTimer = bufferTime;
		}
		if(lattKeyBufferTimer > 0){
			lattKeyBuffered = 1;
			lattKeyBufferTimer -= 1;
		} else {
			lattKeyBuffered = 0;
		}
    
		hiAtHold = hiAt;
		//hiAt = keyboard_check(ord("K")) || (gamepad_button_check(global.plInput[player], gp_face4));
		hiAt = false;
	
		if(hiAt && !hiAtHold){
			hattKeyBufferTimer = bufferTime;
		}
    
		if(hattKeyBufferTimer > 0){
			hattKeyBuffered = 1;
			hattKeyBufferTimer -= 1;
		} else {
			hattKeyBuffered = 0;
		}
    
		spBtHold = spBt;
		//spBt = keyboard_check(ord("L")) || (gamepad_button_check(global.plInput[player], gp_face2));
		spBt = false;
	
		if(spBt && !spBtHold){
			spKeyBufferTimer = bufferTime;
		}
    
		if(spKeyBufferTimer > 0){
			spKeyBuffered = 1;
			spKeyBufferTimer -= 1;
		} else {
			spKeyBuffered = 0;
		}
    
		dashHold = dash;
		//dash = keyboard_check(ord("P")) || (gamepad_button_check(global.plInput[player], gp_shoulderr)) || (gamepad_button_check(global.plInput[player], gp_shoulderrb));
		dash = false;
 
		if (dash && !dashHold){
			dashKeyBufferTimer = bufferTime;
		}
		if(dashKeyBufferTimer > 0){
			dashKeyBuffered = 1;
			dashKeyBufferTimer -= 1;
		} else {
			dashKeyBuffered = 0;
		}

		parryHold = parry;
		//parry = keyboard_check(vk_shift) || (gamepad_button_check(global.plInput[player], gp_shoulderl)) || (gamepad_button_check(global.plInput[player], gp_shoulderlb));
		parry = false;

		if (parry && !parryHold){
			parryKeyBufferTimer = bufferTime;
		}
		if(parryKeyBufferTimer > 0){
			parryKeyBuffered = 1;
			parryKeyBufferTimer -= 1;
		} else {
			parryKeyBuffered = 0;
		}
    
		itemHold = item;
		//item = keyboard_check(vk_shift) || (gamepad_button_check(global.plInput[player], gp_shoulderl)) || (gamepad_button_check(global.plInput[player], gp_shoulderlb));
		item = false;
 
		if (item){
			wallKeyBufferTimer = bufferTime;
		}
		if(wallKeyBufferTimer > 0){
			wallKeyBuffered = 1;
			wallKeyBufferTimer -= 1;
		} else {
			wallKeyBuffered = 0;
		}
	
		pauseHold = pause;
		//pause = keyboard_check(ord("1")) || (gamepad_button_check(global.plInput[0], gp_start));
		pause = false;
	}

/*
	if(player == 0){
	    leftHold  = left;
	    rightHold = right;
	    upHold    = up;
	    downHold  = down;
    
	    left  = keyboard_check(ord("A")) || (gamepad_axis_value(global.plInput[0], gp_axislh) < -0.6) || (gamepad_button_check(global.plInput[0], gp_padl));
    
	    if (left && !leftHold && !god.isPaused){
	        leftKeyBufferTimer = bufferTime;
	    }
	    if(leftKeyBufferTimer > 0){
	        leftKeyBuffered = 1;
	        leftKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        leftKeyBuffered = 0;
	    }
    
	    right = keyboard_check(ord("D")) || (gamepad_axis_value(global.plInput[0], gp_axislh) > 0.6) || (gamepad_button_check(global.plInput[0], gp_padr));
    
	    if (right && !rightHold && !god.isPaused){
	        rightKeyBufferTimer = bufferTime;
	    }
	    if(rightKeyBufferTimer > 0){
	        rightKeyBuffered = 1;
	        rightKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        rightKeyBuffered = 0;
	    }
    
	    up    = keyboard_check(ord("W")) || (gamepad_axis_value(global.plInput[0], gp_axislv) < -0.6) || (gamepad_button_check(global.plInput[0], gp_padu));
    
	    if (up && !upHold && !god.isPaused){
	        upKeyBufferTimer = bufferTime;
	    }
	    if(upKeyBufferTimer > 0){
	        upKeyBuffered = 1;
	        upKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        upKeyBuffered = 0;
	    }
    
	    down  = keyboard_check(ord("S")) || (gamepad_axis_value(global.plInput[0], gp_axislv) > 0.6) || (gamepad_button_check(global.plInput[0], gp_padd));
    
	    if (down && !downHold && !god.isPaused){
	        downKeyBufferTimer = bufferTime;
	    }
	    if(downKeyBufferTimer > 0){
	        downKeyBuffered = 1;
	        downKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        downKeyBuffered = 0;
	    }
    
	    // reset flags cada frame
	    leftDouble  = false;
	    rightDouble = false;
	    upDouble    = false;
	    downDouble  = false;
    
	    // ---------------- LEFT ----------------
	    if (leftKeyBuffered
	    && (!right || !up || !down)) {
	        if (dt_left_timer > 0) {
	            dt_buffer = 1;
	            dt_left_timer = -1;
	        } else {
	            dt_left_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // ---------------- RIGHT ----------------
	    if (rightKeyBuffered
	    && (!left || !up || !down)) {
	        if (dt_right_timer > 0) {
	            dt_buffer = 1;
	            dt_right_timer = -1;
	        } else {
	            dt_right_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // ---------------- UP ----------------
	    if (upKeyBuffered
	    && (!right || !left || !down)) {
	        if (dt_up_timer > 0) {
	            dt_buffer = 1;
	            dt_up_timer = -1;
	        } else {
	            dt_up_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // ---------------- DOWN ----------------
	    if (downKeyBuffered
	    && (!right || !up || !left)) {
	        if (dt_down_timer > 0) {
	            dt_buffer = 1;
	            dt_down_timer = -1;
	        } else {
	            dt_down_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // timers
	    if (dt_left_timer  > 0) dt_left_timer  -= god.gameSpeed;
	    if (dt_right_timer > 0) dt_right_timer -= god.gameSpeed;
	    if (dt_up_timer    > 0) dt_up_timer    -= god.gameSpeed;
	    if (dt_down_timer  > 0) dt_down_timer  -= god.gameSpeed;
    
	    jumpHold = jump;
	    jump = keyboard_check(ord("O")) || gamepad_button_check(global.plInput[0], gp_face1);
		
		jump2 = keyboard_check_pressed(ord("O")) || gamepad_button_check_pressed(global.plInput[0], gp_face1);
    
	    if (jump && !jumpHold && !god.isPaused){
	        jumpKeyBufferTimer = bufferTime;
	    }
	    if(jumpKeyBufferTimer > 0){
	        jumpKeyBuffered = 1;
	        jumpKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        jumpKeyBuffered = 0;
	    }
    
	    if (jump && !god.isPaused){
	        jumpMantKeyBufferTimer = bufferTime;
	    }
	    if(jumpMantKeyBufferTimer > 0){
	        jumpMantKeyBuffered = 1;
	        jumpMantKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        jumpMantKeyBuffered = 0;
	    }

	    lowAtHold = lowAt;
	    lowAt = keyboard_check(ord("I")) || (gamepad_button_check(global.plInput[0], gp_face3));
    
	    if (lowAt && !lowAtHold && !god.isPaused){
	        lattKeyBufferTimer = bufferTime;
	    }
	    if(lattKeyBufferTimer > 0){
	        lattKeyBuffered = 1;
	        lattKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        lattKeyBuffered = 0;
	    }
    
	    hiAtHold = hiAt;
	    hiAt = keyboard_check(ord("K")) || (gamepad_button_check(global.plInput[0], gp_face4));
    
	    if(hiAt && !hiAtHold && !god.isPaused){
	        hattKeyBufferTimer = bufferTime;
	    }
    
	    if(hattKeyBufferTimer > 0){
	        hattKeyBuffered = 1;
	        hattKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        hattKeyBuffered = 0;
	    }
    
	    spBtHold = spBt;
	    spBt = keyboard_check(ord("L")) || (gamepad_button_check(global.plInput[0], gp_face2));
    
	    if(spBt && !spBtHold && !god.isPaused){
	        spKeyBufferTimer = bufferTime;
	    }
    
	    if(spKeyBufferTimer > 0){
	        spKeyBuffered = 1;
	        spKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        spKeyBuffered = 0;
	    }
    
	    dashHold = dash;
	    dash = keyboard_check(ord("P")) || (gamepad_button_check(global.plInput[0], gp_shoulderr)) || (gamepad_button_check(global.plInput[0], gp_shoulderrb));
    
	    if (dash && !dashHold && !god.isPaused){
	        dashKeyBufferTimer = bufferTime;
	    }
	    if(dashKeyBufferTimer > 0){
	        dashKeyBuffered = 1;
	        dashKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        dashKeyBuffered = 0;
	    }

	    parryHold = parry;
	    parry = keyboard_check(vk_shift) || (gamepad_button_check(global.plInput[0], gp_shoulderl)) || (gamepad_button_check(global.plInput[0], gp_shoulderlb));
    
	    if (parry && !parryHold && !god.isPaused){
	        parryKeyBufferTimer = bufferTime;
	    }
	    if(parryKeyBufferTimer > 0){
	        parryKeyBuffered = 1;
	        parryKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        parryKeyBuffered = 0;
	    }
    
	    itemHold = item;
	    item = keyboard_check(vk_shift) || (gamepad_button_check(global.plInput[0], gp_shoulderl)) || (gamepad_button_check(global.plInput[0], gp_shoulderlb));
    
	    if (item && !god.isPaused){
	        wallKeyBufferTimer = bufferTime;
	    }
	    if(wallKeyBufferTimer > 0){
	        wallKeyBuffered = 1;
	        wallKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        wallKeyBuffered = 0;
	    }
    
	    pauseHold = pause;
	    pause = keyboard_check(ord("1")) || (gamepad_button_check(global.plInput[0], gp_start));
	}

	if (player == 1){
	    leftHold  = left;
	    rightHold = right;
	    upHold    = up;
	    downHold  = down;
    
	    left  = keyboard_check(vk_left) || (gamepad_axis_value(global.plInput[1], gp_axislh) < -0.6) || (gamepad_button_check(global.plInput[1], gp_padl));
    
	    if (left && !leftHold && !god.isPaused){
	        leftKeyBufferTimer = bufferTime;
	    }
	    if(leftKeyBufferTimer > 0){
	        leftKeyBuffered = 1;
	        leftKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        leftKeyBuffered = 0;
	    }
    
	    right = keyboard_check(vk_right) || (gamepad_axis_value(global.plInput[1], gp_axislh) > 0.6) || (gamepad_button_check(global.plInput[1], gp_padr));
    
	    if (right && !rightHold && !god.isPaused){
	        rightKeyBufferTimer = bufferTime;
	    }
	    if(rightKeyBufferTimer > 0){
	        rightKeyBuffered = 1;
	        rightKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        rightKeyBuffered = 0;
	    }
    
	    up    = keyboard_check(vk_up) || (gamepad_axis_value(global.plInput[1], gp_axislv) < -0.6) || (gamepad_button_check(global.plInput[1], gp_padu));
    
	    if (up && !upHold && !god.isPaused){
	        upKeyBufferTimer = bufferTime;
	    }
	    if(upKeyBufferTimer > 0){
	        upKeyBuffered = 1;
	        upKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        upKeyBuffered = 0;
	    }
    
	    down  = keyboard_check(vk_down) || (gamepad_axis_value(global.plInput[1], gp_axislv) > 0.6) || (gamepad_button_check(global.plInput[1], gp_padd));
    
	    if (down && !downHold && !god.isPaused){
	        downKeyBufferTimer = bufferTime;
	    }
	    if(downKeyBufferTimer > 0){
	        downKeyBuffered = 1;
	        downKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        downKeyBuffered = 0;
	    }
    
	    // reset flags cada frame
	    leftDouble  = false;
	    rightDouble = false;
	    upDouble    = false;
	    downDouble  = false;
    
	    // ---------------- LEFT ----------------
	    if (leftKeyBuffered
	    && (!right || !up || !down)) {
	        if (dt_left_timer > 0) {
	            dt_buffer = 1;
	            dt_left_timer = -1;
	        } else {
	            dt_left_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // ---------------- RIGHT ----------------
	    if (rightKeyBuffered
	    && (!left || !up || !down)) {
	        if (dt_right_timer > 0) {
	            dt_buffer = 1;
	            dt_right_timer = -1;
	        } else {
	            dt_right_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // ---------------- UP ----------------
	    if (upKeyBuffered
	    && (!right || !left || !down)) {
	        if (dt_up_timer > 0) {
	            dt_buffer = 1;
	            dt_up_timer = -1;
	        } else {
	            dt_up_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // ---------------- DOWN ----------------
	    if (downKeyBuffered
	    && (!right || !up || !left)) {
	        if (dt_down_timer > 0) {
	            dt_buffer = 1;
	            dt_down_timer = -1;
	        } else {
	            dt_down_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // timers
	    if (dt_left_timer  > 0) dt_left_timer  -= god.gameSpeed;
	    if (dt_right_timer > 0) dt_right_timer -= god.gameSpeed;
	    if (dt_up_timer    > 0) dt_up_timer    -= god.gameSpeed;
	    if (dt_down_timer  > 0) dt_down_timer  -= god.gameSpeed;
    
	    jumpHold = jump;
	    jump = keyboard_check(ord("H")) || gamepad_button_check(global.plInput[1], gp_face1);
		
		jump2 = keyboard_check_pressed(ord("H")) || gamepad_button_check_pressed(global.plInput[1], gp_face1);
    
	    if (jump && !jumpHold && !god.isPaused){
	        jumpKeyBufferTimer = bufferTime;
	    }
	    if(jumpKeyBufferTimer > 0){
	        jumpKeyBuffered = 1;
	        jumpKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        jumpKeyBuffered = 0;
	    }
    
	    if (jump && !god.isPaused){
	        jumpMantKeyBufferTimer = bufferTime;
	    }
	    if(jumpMantKeyBufferTimer > 0){
	        jumpMantKeyBuffered = 1;
	        jumpMantKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        jumpMantKeyBuffered = 0;
	    }

	    lowAtHold = lowAt;
	    lowAt = keyboard_check(ord("J")) || (gamepad_button_check(global.plInput[1], gp_face3));
    
	    if (lowAt && !lowAtHold && !god.isPaused){
	        lattKeyBufferTimer = bufferTime;
	    }
	    if(lattKeyBufferTimer > 0){
	        lattKeyBuffered = 1;
	        lattKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        lattKeyBuffered = 0;
	    }
    
	    hiAtHold = hiAt;
	    hiAt = keyboard_check(ord("M")) || (gamepad_button_check(global.plInput[1], gp_face4));
    
	    if(hiAt && !hiAtHold && !god.isPaused){
	        hattKeyBufferTimer = bufferTime;
	    }
    
	    if(hattKeyBufferTimer > 0){
	        hattKeyBuffered = 1;
	        hattKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        hattKeyBuffered = 0;
	    }
    
	    spBtHold = spBt;
	    spBt = keyboard_check(ord("N")) || (gamepad_button_check(global.plInput[1], gp_face2));
    
	    if(spBt && !spBtHold && !god.isPaused){
	        spKeyBufferTimer = bufferTime;
	    }
    
	    if(spKeyBufferTimer > 0){
	        spKeyBuffered = 1;
	        spKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        spKeyBuffered = 0;
	    }
    
	    dashHold = dash;
	    dash = keyboard_check(ord("G")) || (gamepad_button_check(global.plInput[1], gp_shoulderr)) || (gamepad_button_check(global.plInput[1], gp_shoulderrb));
    
	    if (dash && !dashHold && !god.isPaused){
	        dashKeyBufferTimer = bufferTime;
	    }
	    if(dashKeyBufferTimer > 0){
	        dashKeyBuffered = 1;
	        dashKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        dashKeyBuffered = 0;
	    }

	    parryHold = parry;
	    parry = keyboard_check(ord("V")) || (gamepad_button_check(global.plInput[1], gp_shoulderl)) || (gamepad_button_check(global.plInput[1], gp_shoulderlb));
    
	    if (parry && !parryHold && !god.isPaused){
	        parryKeyBufferTimer = bufferTime;
	    }
	    if(parryKeyBufferTimer > 0){
	        parryKeyBuffered = 1;
	        parryKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        parryKeyBuffered = 0;
	    }
    
	    itemHold = item;
	    item = keyboard_check(ord("V")) || (gamepad_button_check(global.plInput[1], gp_shoulderl)) || (gamepad_button_check(global.plInput[1], gp_shoulderlb));
    
	    if (item && !god.isPaused){
	        wallKeyBufferTimer = bufferTime;
	    }
	    if(wallKeyBufferTimer > 0){
	        wallKeyBuffered = 1;
	        wallKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        wallKeyBuffered = 0;
	    }
    
	    pauseHold = pause;
	    pause = keyboard_check(ord("2")) || (gamepad_button_check(global.plInput[1], gp_start));
	}

	if (player == 2){
	    leftHold  = left;
	    rightHold = right;
	    upHold    = up;
	    downHold  = down;
    
	    left  = keyboard_check(vk_left) || (gamepad_axis_value(global.plInput[2], gp_axislh) < -0.6) || (gamepad_button_check(global.plInput[2], gp_padl));
    
	    if (left && !leftHold && !god.isPaused){
	        leftKeyBufferTimer = bufferTime;
	    }
	    if(leftKeyBufferTimer > 0){
	        leftKeyBuffered = 1;
	        leftKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        leftKeyBuffered = 0;
	    }
    
	    right = keyboard_check(vk_right) || (gamepad_axis_value(global.plInput[2], gp_axislh) > 0.6) || (gamepad_button_check(global.plInput[2], gp_padr));
    
	    if (right && !rightHold && !god.isPaused){
	        rightKeyBufferTimer = bufferTime;
	    }
	    if(rightKeyBufferTimer > 0){
	        rightKeyBuffered = 1;
	        rightKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        rightKeyBuffered = 0;
	    }
    
	    up    = keyboard_check(vk_up) || (gamepad_axis_value(global.plInput[2], gp_axislv) < -0.6) || (gamepad_button_check(global.plInput[2], gp_padu));
    
	    if (up && !upHold && !god.isPaused){
	        upKeyBufferTimer = bufferTime;
	    }
	    if(upKeyBufferTimer > 0){
	        upKeyBuffered = 1;
	        upKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        upKeyBuffered = 0;
	    }
    
	    down  = keyboard_check(vk_down) || (gamepad_axis_value(global.plInput[2], gp_axislv) > 0.6) || (gamepad_button_check(global.plInput[2], gp_padd));
    
	    if (down && !downHold && !god.isPaused){
	        downKeyBufferTimer = bufferTime;
	    }
	    if(downKeyBufferTimer > 0){
	        downKeyBuffered = 1;
	        downKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        downKeyBuffered = 0;
	    }
    
	    // reset flags cada frame
	    leftDouble  = false;
	    rightDouble = false;
	    upDouble    = false;
	    downDouble  = false;
    
	    // ---------------- LEFT ----------------
	    if (leftKeyBuffered
	    && (!right || !up || !down)) {
	        if (dt_left_timer > 0) {
	            dt_buffer = 1;
	            dt_left_timer = -1;
	        } else {
	            dt_left_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // ---------------- RIGHT ----------------
	    if (rightKeyBuffered
	    && (!left || !up || !down)) {
	        if (dt_right_timer > 0) {
	            dt_buffer = 1;
	            dt_right_timer = -1;
	        } else {
	            dt_right_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // ---------------- UP ----------------
	    if (upKeyBuffered
	    && (!right || !left || !down)) {
	        if (dt_up_timer > 0) {
	            dt_buffer = 1;
	            dt_up_timer = -1;
	        } else {
	            dt_up_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // ---------------- DOWN ----------------
	    if (downKeyBuffered
	    && (!right || !up || !left)) {
	        if (dt_down_timer > 0) {
	            dt_buffer = 1;
	            dt_down_timer = -1;
	        } else {
	            dt_down_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // timers
	    if (dt_left_timer  > 0) dt_left_timer  -= god.gameSpeed;
	    if (dt_right_timer > 0) dt_right_timer -= god.gameSpeed;
	    if (dt_up_timer    > 0) dt_up_timer    -= god.gameSpeed;
	    if (dt_down_timer  > 0) dt_down_timer  -= god.gameSpeed;
    
	    jumpHold = jump;
	    jump = keyboard_check(ord("H")) || gamepad_button_check(global.plInput[2], gp_face1);
		
		jump2 = keyboard_check_pressed(ord("H")) || gamepad_button_check_pressed(global.plInput[2], gp_face1);
    
	    if (jump && !jumpHold && !god.isPaused){
	        jumpKeyBufferTimer = bufferTime;
	    }
	    if(jumpKeyBufferTimer > 0){
	        jumpKeyBuffered = 1;
	        jumpKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        jumpKeyBuffered = 0;
	    }
    
	    if (jump && !god.isPaused){
	        jumpMantKeyBufferTimer = bufferTime;
	    }
	    if(jumpMantKeyBufferTimer > 0){
	        jumpMantKeyBuffered = 1;
	        jumpMantKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        jumpMantKeyBuffered = 0;
	    }

	    lowAtHold = lowAt;
	    lowAt = keyboard_check(ord("J")) || (gamepad_button_check(global.plInput[2], gp_face3));
    
	    if (lowAt && !lowAtHold && !god.isPaused){
	        lattKeyBufferTimer = bufferTime;
	    }
	    if(lattKeyBufferTimer > 0){
	        lattKeyBuffered = 1;
	        lattKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        lattKeyBuffered = 0;
	    }
    
	    hiAtHold = hiAt;
	    hiAt = keyboard_check(ord("M")) || (gamepad_button_check(global.plInput[2], gp_face4));
    
	    if(hiAt && !hiAtHold && !god.isPaused){
	        hattKeyBufferTimer = bufferTime;
	    }
    
	    if(hattKeyBufferTimer > 0){
	        hattKeyBuffered = 1;
	        hattKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        hattKeyBuffered = 0;
	    }
    
	    spBtHold = spBt;
	    spBt = keyboard_check(ord("N")) || (gamepad_button_check(global.plInput[2], gp_face2));
    
	    if(spBt && !spBtHold && !god.isPaused){
	        spKeyBufferTimer = bufferTime;
	    }
    
	    if(spKeyBufferTimer > 0){
	        spKeyBuffered = 1;
	        spKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        spKeyBuffered = 0;
	    }
    
	    dashHold = dash;
	    dash = keyboard_check(ord("G")) || (gamepad_button_check(global.plInput[2], gp_shoulderr)) || (gamepad_button_check(global.plInput[2], gp_shoulderrb));
    
	    if (dash && !dashHold && !god.isPaused){
	        dashKeyBufferTimer = bufferTime;
	    }
	    if(dashKeyBufferTimer > 0){
	        dashKeyBuffered = 1;
	        dashKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        dashKeyBuffered = 0;
	    }

	    parryHold = parry;
	    parry = keyboard_check(ord("V")) || (gamepad_button_check(global.plInput[2], gp_shoulderl)) || (gamepad_button_check(global.plInput[2], gp_shoulderlb));
    
	    if (parry && !parryHold && !god.isPaused){
	        parryKeyBufferTimer = bufferTime;
	    }
	    if(parryKeyBufferTimer > 0){
	        parryKeyBuffered = 1;
	        parryKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        parryKeyBuffered = 0;
	    }
    
	    itemHold = item;
	    item = keyboard_check(ord("V")) || (gamepad_button_check(global.plInput[2], gp_shoulderl)) || (gamepad_button_check(global.plInput[2], gp_shoulderlb));
    
	    if (item && !god.isPaused){
	        wallKeyBufferTimer = bufferTime;
	    }
	    if(wallKeyBufferTimer > 0){
	        wallKeyBuffered = 1;
	        wallKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        wallKeyBuffered = 0;
	    }
    
	    pauseHold = pause;
	    pause = keyboard_check(ord("2")) || (gamepad_button_check(global.plInput[2], gp_start));
	}

	if (player == 3){
	    leftHold  = left;
	    rightHold = right;
	    upHold    = up;
	    downHold  = down;
    
	    left  = keyboard_check(vk_left) || (gamepad_axis_value(global.plInput[3], gp_axislh) < -0.6) || (gamepad_button_check(global.plInput[3], gp_padl));
    
	    if (left && !leftHold && !god.isPaused){
	        leftKeyBufferTimer = bufferTime;
	    }
	    if(leftKeyBufferTimer > 0){
	        leftKeyBuffered = 1;
	        leftKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        leftKeyBuffered = 0;
	    }
    
	    right = keyboard_check(vk_right) || (gamepad_axis_value(global.plInput[3], gp_axislh) > 0.6) || (gamepad_button_check(global.plInput[3], gp_padr));
    
	    if (right && !rightHold && !god.isPaused){
	        rightKeyBufferTimer = bufferTime;
	    }
	    if(rightKeyBufferTimer > 0){
	        rightKeyBuffered = 1;
	        rightKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        rightKeyBuffered = 0;
	    }
    
	    up    = keyboard_check(vk_up) || (gamepad_axis_value(global.plInput[3], gp_axislv) < -0.6) || (gamepad_button_check(global.plInput[3], gp_padu));
    
	    if (up && !upHold && !god.isPaused){
	        upKeyBufferTimer = bufferTime;
	    }
	    if(upKeyBufferTimer > 0){
	        upKeyBuffered = 1;
	        upKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        upKeyBuffered = 0;
	    }
    
	    down  = keyboard_check(vk_down) || (gamepad_axis_value(global.plInput[3], gp_axislv) > 0.6) || (gamepad_button_check(global.plInput[3], gp_padd));
    
	    if (down && !downHold && !god.isPaused){
	        downKeyBufferTimer = bufferTime;
	    }
	    if(downKeyBufferTimer > 0){
	        downKeyBuffered = 1;
	        downKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        downKeyBuffered = 0;
	    }
    
	    // reset flags cada frame
	    leftDouble  = false;
	    rightDouble = false;
	    upDouble    = false;
	    downDouble  = false;
    
	    // ---------------- LEFT ----------------
	    if (leftKeyBuffered
	    && (!right || !up || !down)) {
	        if (dt_left_timer > 0) {
	            dt_buffer = 1;
	            dt_left_timer = -1;
	        } else {
	            dt_left_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // ---------------- RIGHT ----------------
	    if (rightKeyBuffered
	    && (!left || !up || !down)) {
	        if (dt_right_timer > 0) {
	            dt_buffer = 1;
	            dt_right_timer = -1;
	        } else {
	            dt_right_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // ---------------- UP ----------------
	    if (upKeyBuffered
	    && (!right || !left || !down)) {
	        if (dt_up_timer > 0) {
	            dt_buffer = 1;
	            dt_up_timer = -1;
	        } else {
	            dt_up_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // ---------------- DOWN ----------------
	    if (downKeyBuffered
	    && (!right || !up || !left)) {
	        if (dt_down_timer > 0) {
	            dt_buffer = 1;
	            dt_down_timer = -1;
	        } else {
	            dt_down_timer = 30;
	            dt_buffer = 0;
	        }
	    }
    
	    // timers
	    if (dt_left_timer  > 0) dt_left_timer  -= god.gameSpeed;
	    if (dt_right_timer > 0) dt_right_timer -= god.gameSpeed;
	    if (dt_up_timer    > 0) dt_up_timer    -= god.gameSpeed;
	    if (dt_down_timer  > 0) dt_down_timer  -= god.gameSpeed;
    
	    jumpHold = jump;
	    jump = keyboard_check(ord("H")) || gamepad_button_check(global.plInput[3], gp_face1);
		
		jump2 = keyboard_check_pressed(ord("H")) || gamepad_button_check_pressed(global.plInput[3], gp_face1);
    
	    if (jump && !jumpHold && !god.isPaused){
	        jumpKeyBufferTimer = bufferTime;
	    }
	    if(jumpKeyBufferTimer > 0){
	        jumpKeyBuffered = 1;
	        jumpKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        jumpKeyBuffered = 0;
	    }
    
	    if (jump && !god.isPaused){
	        jumpMantKeyBufferTimer = bufferTime;
	    }
	    if(jumpMantKeyBufferTimer > 0){
	        jumpMantKeyBuffered = 1;
	        jumpMantKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        jumpMantKeyBuffered = 0;
	    }

	    lowAtHold = lowAt;
	    lowAt = keyboard_check(ord("J")) || (gamepad_button_check(global.plInput[3], gp_face3));
    
	    if (lowAt && !lowAtHold && !god.isPaused){
	        lattKeyBufferTimer = bufferTime;
	    }
	    if(lattKeyBufferTimer > 0){
	        lattKeyBuffered = 1;
	        lattKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        lattKeyBuffered = 0;
	    }
    
	    hiAtHold = hiAt;
	    hiAt = keyboard_check(ord("M")) || (gamepad_button_check(global.plInput[3], gp_face4));
    
	    if(hiAt && !hiAtHold && !god.isPaused){
	        hattKeyBufferTimer = bufferTime;
	    }
    
	    if(hattKeyBufferTimer > 0){
	        hattKeyBuffered = 1;
	        hattKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        hattKeyBuffered = 0;
	    }
    
	    spBtHold = spBt;
	    spBt = keyboard_check(ord("N")) || (gamepad_button_check(global.plInput[3], gp_face2));
    
	    if(spBt && !spBtHold && !god.isPaused){
	        spKeyBufferTimer = bufferTime;
	    }
    
	    if(spKeyBufferTimer > 0){
	        spKeyBuffered = 1;
	        spKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        spKeyBuffered = 0;
	    }
    
	    dashHold = dash;
	    dash = keyboard_check(ord("G")) || (gamepad_button_check(global.plInput[3], gp_shoulderr)) || (gamepad_button_check(global.plInput[3], gp_shoulderrb));
    
	    if (dash && !dashHold && !god.isPaused){
	        dashKeyBufferTimer = bufferTime;
	    }
	    if(dashKeyBufferTimer > 0){
	        dashKeyBuffered = 1;
	        dashKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        dashKeyBuffered = 0;
	    }

	    parryHold = parry;
	    parry = keyboard_check(ord("V")) || (gamepad_button_check(global.plInput[3], gp_shoulderl)) || (gamepad_button_check(global.plInput[3], gp_shoulderlb));
    
	    if (parry && !parryHold && !god.isPaused){
	        parryKeyBufferTimer = bufferTime;
	    }
	    if(parryKeyBufferTimer > 0){
	        parryKeyBuffered = 1;
	        parryKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        parryKeyBuffered = 0;
	    }
    
	    itemHold = item;
	    item = keyboard_check(ord("V")) || (gamepad_button_check(global.plInput[3], gp_shoulderl)) || (gamepad_button_check(global.plInput[3], gp_shoulderlb));
    
	    if (item && !god.isPaused){
	        wallKeyBufferTimer = bufferTime;
	    }
	    if(wallKeyBufferTimer > 0){
	        wallKeyBuffered = 1;
	        wallKeyBufferTimer -= 1 * god.gameSpeed;
	    } else {
	        wallKeyBuffered = 0;
	    }
    
	    pauseHold = pause;
	    pause = keyboard_check(ord("2")) || (gamepad_button_check(global.plInput[3], gp_start));
	}

*/
}
