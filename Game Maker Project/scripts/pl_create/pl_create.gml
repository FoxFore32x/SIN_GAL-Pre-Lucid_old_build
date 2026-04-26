function pl_create() {
	//inherit from parent object
	event_inherited();
	controlsSetup();

	landed = 0;

	canPlay = true;

	// >= 0: Human PLayers
	// < 0: CPU Players
	player = 0;

	onGround = 0;
	isCrouching = false;
	hasTumbled = false;

	onSideWall = 0;
	alrWS = false;

	maxVelInit = 6;
	maxVel = 6;

	freezeHLim = 10;
	freezeLLim = 5;

	freeze = 0;
	freezeStored = false;
	isFrozen = false;
	tempXSpeed = 0;
	tempYSpeed = 0;

	//CPU
	immobile = false;
	attackCooldown = 0;
	walkPause = 0;
	parryPause = 0;

	//buttons
	up    = false;
	down  = false;
	left  = false;
	right = false;

	leftHold  = left;
	rightHold = right;
	upHold    = up;
	downHold  = down;

	dt_buffer = 0;

	dt_left_timer  = -1;
	dt_right_timer = -1;
	dt_up_timer    = -1;
	dt_down_timer  = -1;

	leftDouble  = false;
	rightDouble = false;
	upDouble    = false;
	downDouble  = false;

	jump  = false;
	jumpHold = false;

	attack = false;
	attackHold = false;

	//Attack btns
	lowAt = false;
	lowAtHold = false;

	hiAt = false;
	hiAtHold = false;

	spBtHold = false;
	spBt = false;

	dash = false;
	dashHold = false;

	parry = false;
	parryHold = false;

	item = false;
	itemHold = false;

	mash = false;
	superJump = false;

	pause = false;
	pauseHold = false;

	//states
	currentState = states.normal;
	lastState    = currentState;
	subState     = states.normal;
	prevState    = states.normal;

	//movement
	mSpeed = 2 * (global.sprScale);
	mSpeedDefault = mSpeed;
	aSpeed = 0.5 * (global.sprScale);
	aSpeedDefault = aSpeed;
	cSpeed = 1 * (global.sprScale);
	cSpeedDefault = cSpeed;
	tSpeed = 10 * (global.sprScale);
	tSpeedDefault = tSpeed;
	jPower = -5 * (global.sprScale);
	facing = 1;

	isJump = false;
	canJump = false;
	passTrough = false;
	jumpThru = noone;
	thruPlat = noone;
	movePlat = noone;

	isDash = false;
	dashed = false;
	isMoving = false;
	dashCanCldnMax = 20;
	dashCanCldn = 0;
	custDash = false;

	gSpeedDefault = gSpeed;

	dashDur = 12;
	dashDurMax = 12;
	parryDur = 18;
	parryDurMax = 18;
	recoverDur = 10;
	bgWallDur = 40;
	bgWallDurMax = 40;
	wallGrabMax = 40;
	wallGrabTimer = 40;
	dashHSpeed = 6.5 * global.sprScale;
	dashYSpeed = 6.5 * global.sprScale;
	parryHitStun = 25;
	perParryHS = 60;
	perParryTim = 5;
	dashAntLimit = 5;
	dashAnt = 5;
	dashJCoolMax = 100;
	dashJCool = 0;
	invFrames = 10;
	atFloatTim = 0;

	//Coyote Time
	//Hang Time
	coyoteHangFrames = 2;
	coyoteHangTimer = 0;

	//Jump Buffer Time
	coyoteJumpFrames = 5;
	coyoteJumpTimer = 0;

	isWallGrabbing = false;
	canWallGrab = false;
	parried = false;
	parryActive = false;
	airDash = false;
	willDash = false;
	invins = false;
	unTumbled = false;
	strongAt = false;

	//Combo
	jabLimit= 2;
	jabCnt= 0;
	hJabLimit = 1;
	hJabCnt = 0;
	comboCnt= 0;
	comboTimerLimit = 60;
	comboTimer= 60;
	isCombing= false;
	cxHit= 0;
	cyHit= 0;
	chitTimer= 0;
	dashHitX = 0;
	dashHitY = 0;

	//Attack Stats
	upperAtt = 0;
	sideAtt = 0;
	downAtt = 0;

	upperAttS = 0;
	sideAttS = 0;
	downAttS = 0;

	//Attack directions
	upAtX = 0;
	sideAtX = 0;
	downAtX = 0;
	upAtY = 0;
	sideAtY = 0;
	downAtY = 0;

	upAtSX = 0;
	sideAtSX = 0;
	downAtSX = 0;
	upAtSY = 0;
	sideAtSY = 0;
	downAtSY = 0;

	//Attack timers
	upAtT = 0;
	sideAtT = 0;
	downAtT = 0;

	upAtST = 0;
	sideAtST = 0;
	downAtT = 0;
	
	shieldMax = 100;
	shield = 0;
	
	attDirX = noone;
	attDirY = noone;

	//fighting
	//hit and hurtboxes
	hbox_init();
	
	hitOffX = 0;
	hitOffY = 0;
	hitWidth = 0;
	hitHeight = 0;
	hitDur = 0;

	hpMax = 1000;
	hp    = hpMax;
	deathFrames = 5;
	dead = false;
	loop = true;
	
	attOnGround = false;

	stunDur = 0;
	knockBack = false;

	//attack
	attackType = attacks.side_ground;

	//hit
	hit = false;
	halfCombo = false;
	downGroundHit = false;
	hitBy = noone; //Obsolete
	oHitBy = noone; //hitBy.owner for other funcs.
	hitQueue = ds_list_create();
	
	prevBgWall = noone;

	plId = 0;

	//frame data
	pl_frameData();

	//draw
	animation_create();

	//weapons
	weapon = weapons.sword;
	weapon_stats();
	
	character = characters.teori;

	stored = false;

	//destroy
	destroy = false;






}
