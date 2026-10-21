function pl_spAttackState(){
	
	chitTimer -= 1 * god.gameSpeed;
	
	//reset to normal state when the attack animation ends
	if(/*animation_end() ||*/ chitTimer == 0){
		canPlay = true;
		willDash = false;
		attOnGround = false;
		smallStop = false;
		smallStAtJumpAct = false;
		tSpeed = 10 * (global.sprScale);
		state_reset();
	}
}