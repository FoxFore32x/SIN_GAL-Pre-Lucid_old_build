switch(section){
	case 0:
		
	break;
	case 1:

	_vidPos = video_get_position();
	_vidDur = video_get_duration();
	_vidStatus = video_get_status();
	
	if(!isVideoPlaying){
		video = video_open("jojo480.mp4");
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
	global.credits += 1;
}

if (btnDecline){
	debug = !debug;
}

if (global.credits >= 1 && start){
	global.credits -= 1;
	play_sfx(sfxPlayerStart, 0, 0);
	room_goto(rm_menu);
}