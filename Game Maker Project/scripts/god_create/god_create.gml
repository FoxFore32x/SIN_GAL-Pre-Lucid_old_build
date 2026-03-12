function god_create() {
	enum_init(); //initialize all of the state, and weapon info

	//player checks
	global.existentPl = global.players + global.cpus;

	//Winner
	global.winId[0] = 0;
	global.winId[1] = 0;
	global.winId[2] = 0;
	global.winId[3] = 0;
	global.winnerVar = 0;

	isPaused = false;
	timer = 400 * 2 * room_speed;  // 3 seconds
	//screen shake
	shake = false; //shake true or false
	shakeDur = 5; //how long the shake lasts
	shakeForce = 1;

	//freeze/hitstop
	gameSpeed = 1; //used for hitstop/freeze
	freeze = false; //freeze true or false
	freezeDur = 5; //how long the freeze lasts

	//debug
	showBox = false; //used to show hitboxes

}
