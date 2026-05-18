if (trainTime > 0)trainTime -= 1 * god.gameSpeed;
else {
	if(dist > 0){
		if(dist == distLimit) hitbox_create(0, 0, sprite_width, sprite_height, dist, xHit, yHit, 200, 200, obstacle);
		xSpeed = (xDir * spd) * god.gameSpeed;
		facing = sign(xDir)
		ySpeed = (yDir * spd) * god.gameSpeed;
		dist -= 1 * god.gameSpeed;
	} else {
		x = initX;
		y = initY;
		dist = distLimit;
		trainTime = timeLimit;
		
        if(dissapears)
        {
            if(instance_exists(hitbox))
            {
                instance_destroy(hitbox);
            }

            hitbox = -1;

            instance_destroy();
        }
	}
	
	x += xSpeed;
	y += ySpeed;
}