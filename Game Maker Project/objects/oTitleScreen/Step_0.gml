var btnJump = (jump2);
var start = (pause2);

if (btnJump){
	play_sfx(sfxCoinUp, 0, 0);
	global.credits += 1;
}

if (global.credits >= 1 && start){
	global.credits -= 1;
	play_sfx(sfxPlayerStart, 0, 0);
	room_goto(rm_menu);
}