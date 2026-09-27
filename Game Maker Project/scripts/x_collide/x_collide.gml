function x_collide() {
	//zero out xSpeed when colliding with a wall
	if((xSpeed >= 2 || xSpeed <= -2) && hitStun > 0){
		xSpeed = (abs(xSpeed) / (1.5 * facing));
		if(xSpeed >= 4){
			xSpeed = 4;
		}
		hitStun -= 30;
		if(ySpeed >= 0) ySpeed = ySpeed * 1.75;
	} else {
		xSpeed = 0;
	}



}
