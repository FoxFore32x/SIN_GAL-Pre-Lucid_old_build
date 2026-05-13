if (time > 0)time -= 1 * god.gameSpeed;
else {
	if(dist > 0){
		if(dist = distLimit) hitbox_create(0, 0, sprite_width, sprite_height, dist, xHit, yHit, 200, 200,obstacle);
		xSpeed = (xDir * spd) * god.gameSpeed;
		facing = sign(x)
		ySpeed = (yDir * spd) * god.gameSpeed;
		dist -= 1 * god.gameSpeed;
	} else {
		x = initX;
		y = initY;
		dist = distLimit;
		time = timeLimit;
	}
	
	x += xSpeed;
	y += ySpeed;
}