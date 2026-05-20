if ((trainTime > 0 && !needsActiv) || !active){
	if(!needsActiv) trainTime -= 1 * god.gameSpeed;
}
else {
	if(dist > 0){
		xSpeed = (xDir * spd) * god.gameSpeed;
		facing = sign(xDir)
		ySpeed = (yDir * spd) * god.gameSpeed;
		dist -= 1 * god.gameSpeed;
	} else {
		x = initX;
		y = initY;
		dist = distLimit;
		trainTime = timeLimit;
		hitBoxSpawned = false;
		
		if(dissapears) instance_destroy();
	}
	x += xSpeed;
	y += ySpeed;
}