function initInGameMode(modeId){
	god.timer = 400 * room_speed;  // 3 seconds
	audio_stop_sound(sndMenu);
	switch(modeId){
		
		case modes.story:
			global.arcadeMode = true;
			global.opHp = true;
			global.opTimer = true;
			room_goto(ts_1);
		break;
		
		case modes.vs:
			//global.existentPl = global.players + global.cpus;
			global.arcadeMode = false;
			global.opHp = true;
			global.opTimer = true;
			room_goto(rm_battletest);
		break;
		
		case modes.training:
			global.arcadeMode = false;
			global.opHp = false;
			global.opTimer = false;
			room_goto(rm_training);
		break;
	}
}