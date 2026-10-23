switch(section){
	case 0:
		if(room != rm_titleScreen){
			instance_destroy(oHurtbox);
			instance_destroy(oPlayer);
			audio_stop_all();
			room_goto(rm_titleScreen);
		}
	break;
	case 1:

	_vidPos = video_get_position();
	_vidDur = video_get_duration();
	_vidStatus = video_get_status();
	
	if(os_type == os_switch){
		vidCheck = (shaders_are_supported() && shader_is_compiled(shdSwitchVideo));
	} else vidCheck = true;
	
	if(!isVideoPlaying && vidCheck){
		if(os_type == os_switch)  video_sampler = shader_get_sampler_index(shdSwitchVideo, "v_chroma");
		video = video_open("chicken.mp4");
		video_enable_loop(false);
		if (_vidStatus == video_status_playing) isVideoPlaying = true;
	}
	
	if( isVideoPlaying && _vidStatus != video_status_playing){
		sectionTime = 0;
	}
	
	break;
	case 2:
	
	break;
	case 3:
		if(room != rm_battle){
			audio_stop_sound(sndWinScreen);
			global.playerId[0] = 0;
			global.playerId[1] = 0;
			global.playerId[2] = 0;
			global.playerId[3] = 0;

			global.arcadeMode = false;
			global.arPlCreated = false;
			global.uLostLmao = false;
			global.arPlWon = false;

			global.cpus = irandom_range(1, 3);
			global.existentPl = global.cpus;
			for(var i = 0; i < global.cpus; i++){
				global.playerChar[i] = irandom_range(1, 3);
			}
			global.currentMode = modes.demo;
			initInGameMode(global.currentMode);
			//room_goto(rm_battle);
		}
	break;
}

if(sectionTime > 0){
	sectionTime -= 1 * god.gameSpeed;
	if (sectionTime < 0) sectionTime = 0;
}

if (sectionTime == 0) {
    fadeLevel += 0.050;
    if (fadeLevel >= 1) {
		isVideoPlaying = false;
		if(section >= 4) section = 0;
		else section++;
		video_close();
		if (section < array_length(sectionTimeMax))
            sectionTime = sectionTimeMax[section];
    }
}
else {
	fadeLevel -= 0.050;
}

if (fadeLevel < 0) fadeLevel = 0;

if(creditTxtTimer > 0){
	creditTxtTimer -= 1 * god.gameSpeed;
} else {
	creditTxtTimer = creditTxtTimerMax;
}

var btnJump = (jump2);
var btnDecline = (global.keyLight2All);
var start = (pause2);

if (btnJump){
	video_close();
	isVideoPlaying = false;
	creditTxtTimer = creditTxtTimerMax;
	play_sfx(sfxCoinUp, 0, 0);
	section = 2;
	if (section < array_length(sectionTimeMax))
            sectionTime = sectionTimeMax[section];
	if(room != rm_titleScreen){
		instance_destroy(oHurtbox);
		instance_destroy(oPlayer);
		audio_stop_all();
		room_goto(rm_titleScreen);
	}
	global.credits += 1;
}

if (btnDecline){
	debug = !debug;
}

if (global.credits >= 1 && start){
	video_close();
	isVideoPlaying = false;
	audio_stop_all();
	instance_destroy(oHurtbox);
	instance_destroy(oPlayer);
	global.credits -= 1;
	play_sfx(sfxPlayerStart, 0, 0);
	instance_destroy();
	room_goto(rm_menu);
}