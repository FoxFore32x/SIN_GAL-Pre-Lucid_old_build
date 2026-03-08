function pl_hitReset() {
	//Reset properties
	dashDur = 0;
	dashAnt = dashAntLimit;
	willDash = false;
	tSpeed = 10 * (global.sprScale);
	isDash = false;
	isWallGrabbing = false;
	wallGrabTimer = -1;

	isCombing = false;
	comboCnt = 0;
	jabCnt = 0;
	comboTimer = 0;



}
