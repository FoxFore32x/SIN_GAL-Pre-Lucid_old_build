/// @description grounded and gravity
setOnGround(check_below());

if(!onGround){
    if (coyoteHangTimer > 0 && !passTrough) coyoteHangTimer--;
    else {
        ySpeed += gSpeed * god.gameSpeed;
        setOnGround(false);
    }
}

