inputUpdate();
globalKeys();

leftHold  = left;
rightHold = right;
upHold    = up;
downHold  = down;
    
//left = keyboard_check(ord("A")) || (gamepad_axis_value(global.plInput[player], gp_axislh) < -0.6) || (gamepad_button_check(global.plInput[player], gp_padl));
left = global.keyLeftAll;

if (left && !leftHold){
	leftKeyBufferTimer = bufferTime;
}
if(leftKeyBufferTimer > 0){
	leftKeyBuffered = 1;
	leftKeyBufferTimer -= 1;
} else {
	leftKeyBuffered = 0;
}
    
//right = keyboard_check(ord("D")) || (gamepad_axis_value(global.plInput[player], gp_axislh) > 0.6) || (gamepad_button_check(global.plInput[player], gp_padr));
right = global.keyRightAll;

if (right && !rightHold){
	rightKeyBufferTimer = bufferTime;
}
if(rightKeyBufferTimer > 0){
	rightKeyBuffered = 1;
	rightKeyBufferTimer -= 1;
} else {
	rightKeyBuffered = 0;
}
    
//up = keyboard_check(ord("W")) || (gamepad_axis_value(global.plInput[player], gp_axislv) < -0.6) || (gamepad_button_check(global.plInput[player], gp_padu));
up = global.keyUpAll;

if (up && !upHold){
	upKeyBufferTimer = bufferTime;
}
if(upKeyBufferTimer > 0){
	upKeyBuffered = 1;
	upKeyBufferTimer -= 1;
} else {
	upKeyBuffered = 0;
}
    
//down = keyboard_check(ord("S")) || (gamepad_axis_value(global.plInput[player], gp_axislv) > 0.6) || (gamepad_button_check(global.plInput[player], gp_padd));
down = global.keyDownAll;

if (down && !downHold){
	downKeyBufferTimer = bufferTime;
}
if(downKeyBufferTimer > 0){
	downKeyBuffered = 1;
	downKeyBufferTimer -= 1;
} else {
	downKeyBuffered = 0;
}
    
// reset flags cada frame
leftDouble  = false;
rightDouble = false;
upDouble    = false;
downDouble  = false;
    
// ---------------- LEFT ----------------
if (leftKeyBuffered && (!right || !up || !down)) {
	if (dt_left_timer > 0) {
		dt_buffer = 1;
		dt_left_timer = -1;
	} else {
		dt_left_timer = 30;
		dt_buffer = 0;
	}
}
    
// ---------------- RIGHT ----------------
if (rightKeyBuffered	&& (!left || !up || !down)) {
	if (dt_right_timer > 0) {
		dt_buffer = 1;
		dt_right_timer = -1;
	} else {
		dt_right_timer = 30;
		dt_buffer = 0;
	}
}
    
// ---------------- UP ----------------
if (upKeyBuffered && (!right || !left || !down)) {
	if (dt_up_timer > 0) {
		dt_buffer = 1;
		dt_up_timer = -1;
	} else {
		dt_up_timer = 30;
		dt_buffer = 0;
	}
}
    
// ---------------- DOWN ----------------
if (downKeyBuffered && (!right || !up || !left)) {
	if (dt_down_timer > 0) {
		dt_buffer = 1;
		dt_down_timer = -1;
	} else {
		dt_down_timer = 30;
		dt_buffer = 0;
	}
}
    
// timers
if (dt_left_timer  > 0) dt_left_timer  -= 1;
if (dt_right_timer > 0) dt_right_timer -= 1;
if (dt_up_timer    > 0) dt_up_timer    -= 1;
if (dt_down_timer  > 0) dt_down_timer  -= 1;
    
jumpHold = jump;
//jump = keyboard_check(ord("O")) || gamepad_button_check(global.plInput[player], gp_face1);
//jump2 = keyboard_check_pressed(ord("O")) || gamepad_button_check_pressed(global.plInput[player], gp_face1);
jump = global.keyJumpAll;
jump2 = global.keyJump2All;
	
if (jump && !jumpHold){
	jumpKeyBufferTimer = bufferTime;
}
if(jumpKeyBufferTimer > 0){
	jumpKeyBuffered = 1;
	jumpKeyBufferTimer -= 1;
} else {
	jumpKeyBuffered = 0;
}
    
if (jump){
	jumpMantKeyBufferTimer = bufferTime;
}
if(jumpMantKeyBufferTimer > 0){
	jumpMantKeyBuffered = 1;
	jumpMantKeyBufferTimer -= 1;
} else {
	jumpMantKeyBuffered = 0;
}

lowAtHold = lowAt;
//lowAt = keyboard_check(ord("I")) || (gamepad_button_check(global.plInput[player], gp_face3));
lowAt = global.keyLightAll;
	
if (lowAt && !lowAtHold){
	lattKeyBufferTimer = bufferTime;
}
if(lattKeyBufferTimer > 0){
	lattKeyBuffered = 1;
	lattKeyBufferTimer -= 1;
} else {
	lattKeyBuffered = 0;
}
    
hiAtHold = hiAt;
//hiAt = keyboard_check(ord("K")) || (gamepad_button_check(global.plInput[player], gp_face4));
hiAt = global.keyStrongAll;
	
if(hiAt && !hiAtHold){
	hattKeyBufferTimer = bufferTime;
}
    
if(hattKeyBufferTimer > 0){
	hattKeyBuffered = 1;
	hattKeyBufferTimer -= 1;
} else {
	hattKeyBuffered = 0;
}
    
spBtHold = spBt;
//spBt = keyboard_check(ord("L")) || (gamepad_button_check(global.plInput[player], gp_face2));
spBt = global.keySpecialAll;
	
if(spBt && !spBtHold){
	spKeyBufferTimer = bufferTime;
}
    
if(spKeyBufferTimer > 0){
	spKeyBuffered = 1;
	spKeyBufferTimer -= 1;
} else {
	spKeyBuffered = 0;
}
    
dashHold = dash;
//dash = keyboard_check(ord("P")) || (gamepad_button_check(global.plInput[player], gp_shoulderr)) || (gamepad_button_check(global.plInput[player], gp_shoulderrb));
dash = global.keyDashAll;
 
if (dash && !dashHold){
	dashKeyBufferTimer = bufferTime;
}
if(dashKeyBufferTimer > 0){
	dashKeyBuffered = 1;
	dashKeyBufferTimer -= 1;
} else {
	dashKeyBuffered = 0;
}

parryHold = parry;
//parry = keyboard_check(vk_shift) || (gamepad_button_check(global.plInput[player], gp_shoulderl)) || (gamepad_button_check(global.plInput[player], gp_shoulderlb));
parry = global.keyBlockAll;

if (parry && !parryHold){
	parryKeyBufferTimer = bufferTime;
}
if(parryKeyBufferTimer > 0){
	parryKeyBuffered = 1;
	parryKeyBufferTimer -= 1;
} else {
	parryKeyBuffered = 0;
}
    
itemHold = item;
//item = keyboard_check(vk_shift) || (gamepad_button_check(global.plInput[player], gp_shoulderl)) || (gamepad_button_check(global.plInput[player], gp_shoulderlb));
item = global.keyBlockAll;
 
if (item){
	wallKeyBufferTimer = bufferTime;
}
if(wallKeyBufferTimer > 0){
	wallKeyBuffered = 1;
	wallKeyBufferTimer -= 1;
} else {
	wallKeyBuffered = 0;
}

pauseHold = pause;
//pause = keyboard_check(ord("1")) || (gamepad_button_check(global.plInput[0], gp_start));
pause = global.keyPauseAll;