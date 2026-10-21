/// @description grounded and gravity

// Begin Step, before collision handling

movePlat = instance_place(x, y + max(1, ySpeed), moveJumpthru);

if(movePlat && bbox_bottom <= movePlat.bbox_bottom && !passTrough){
	
	if(ySpeed > 0){
		while(!place_meeting(x, y + sign(ySpeed), moveJumpthru)){
			y += sign(ySpeed);
		}
		
		ySpeed = 0;
	}
	
	x += movePlat.hSpd;
	y += movePlat.vSpd;
	
	setOnGround(place_meeting(x, y+1, movePlat));
	
} else {
	setOnGround(check_below());
	
}



if(!onGround){
    if (coyoteHangTimer > 0 && !passTrough) coyoteHangTimer--;
    else {
        ySpeed += gSpeed * god.gameSpeed;
        setOnGround(false);
    }
}
