if (time > 0) time -= 1 * god.gameSpeed;
else {
	if(dist > 0){
		x = (xDir * spd) * god.gameSpeed;
		y = (yDir * spd) * god.gameSpeed;
		dist -= 1 * god.gameSpeed;
	} else {
		dist = distLimit;
		time = timeLimit;
	}
}