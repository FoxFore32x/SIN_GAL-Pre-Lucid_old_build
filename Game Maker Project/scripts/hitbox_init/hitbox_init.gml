function hitbox_init() {
	dur     = 0; //number of frames the hitbox is active
	xHit    = 0; //horizontal knock back
	yHit    = 0; //vertical knock back
	hitStun = 0; //hit stun duration
	damage  = 0; //damage dealt
	angle   = 0; //rotation of hitbox
	comboGranted = false; //it's for tracking a single hit when hitting all players
	obstacle = false; //hazards
	isGrab = false; //for player grabs

	destroy = false; //used when deleting/destroying the hitbox object

	ignoreList = ds_list_create(); //list where hit player IDs are stored
	ignore = false; //used to determine if a player can be hit


}
