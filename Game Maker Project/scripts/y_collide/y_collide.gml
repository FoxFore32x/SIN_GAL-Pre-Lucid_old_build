function y_collide() {
	//zero out yspeed when colliding with floor or ceiling
	
	if((ySpeed >= 2 || ySpeed <= -2) && (hitStun > 0 && onGround)){
		if(ySpeed >= 4) ySpeed = -4;
	} else ySpeed = 0;
	
	
}
