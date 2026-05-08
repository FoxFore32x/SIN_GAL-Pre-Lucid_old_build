function hbox_init() {
	//initialize a bunch of hitbox and hurtbox info
	hurtbox = hurtbox_create(-6*(global.sprScale),-22*(global.sprScale),12*(global.sprScale),22*(global.sprScale)); //create and store hurtbox
	
	hitbox  = -1; //default hitbox variable

	dur     = 0; //number of frames the hitbox is active
	xHit    = 0; //horizontal knock back
	yHit    = 0; //vertical knock back
	hitStun = 0; //hit stun duration
	damage  = 0; //damage dealt
	invincible = false; //what it sounds like
	comboGranted = false; //it's for tracking a single hit when hitting all players
	obstacle = false;



}
