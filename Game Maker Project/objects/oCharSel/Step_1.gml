    leftHold  = left;
    rightHold = right;
    upHold    = up;
    downHold  = down;
    
    left  = keyboard_check(ord("A")) || (gamepad_axis_value(global.plInput[0], gp_axislh) < -0.6) || (gamepad_button_check(global.plInput[0], gp_padl));
    
    if (left && !leftHold){
        leftKeyBufferTimer = bufferTime;
    }
    if(leftKeyBufferTimer > 0){
        leftKeyBuffered = 1;
        leftKeyBufferTimer -= 1;
    } else {
        leftKeyBuffered = 0;
    }
    
    right = keyboard_check(ord("D")) || (gamepad_axis_value(global.plInput[0], gp_axislh) > 0.6) || (gamepad_button_check(global.plInput[0], gp_padr));
    
    if (right && !rightHold){
        rightKeyBufferTimer = bufferTime;
    }
    if(rightKeyBufferTimer > 0){
        rightKeyBuffered = 1;
        rightKeyBufferTimer -= 1;
    } else {
        rightKeyBuffered = 0;
    }
    
    up    = keyboard_check(ord("W")) || (gamepad_axis_value(global.plInput[0], gp_axislv) < -0.6) || (gamepad_button_check(global.plInput[0], gp_padu));
    
    if (up && !upHold){
        upKeyBufferTimer = bufferTime;
    }
    if(upKeyBufferTimer > 0){
        upKeyBuffered = 1;
        upKeyBufferTimer -= 1;
    } else {
        upKeyBuffered = 0;
    }
    
    down  = keyboard_check(ord("S")) || (gamepad_axis_value(global.plInput[0], gp_axislv) > 0.6) || (gamepad_button_check(global.plInput[0], gp_padd));
    
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
    if (dt_left_timer  > 0) dt_left_timer  -= 1;
    if (dt_right_timer > 0) dt_right_timer -= 1;
    if (dt_up_timer    > 0) dt_up_timer    -= 1;
    if (dt_down_timer  > 0) dt_down_timer  -= 1;
    
    jumpHold = jump;
    jump = keyboard_check(ord("O")) || gamepad_button_check(global.plInput[0], gp_face1);
	
	jump2 = keyboard_check_pressed(ord("O")) || gamepad_button_check_pressed(global.plInput[0], gp_face1);
    
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
    lowAt = keyboard_check(ord("I")) || (gamepad_button_check(global.plInput[0], gp_face3));
    
    if (lowAt && !lowAtHold){
        lattKeyBufferTimer = bufferTime;
    }
    if(lattKeyBufferTimer > 0){
        lattKeyBuffered = 1;
        lattKeyBufferTimer -= 1;
    } else {
        lattKeyBuffered = 0;
    }
    