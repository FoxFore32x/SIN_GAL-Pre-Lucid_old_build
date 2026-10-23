var slot = instance_place(x, y, oCharSlot);
if(slot != noone) char = slot.character;
else char = 0;

if (global.keyAny[asigndPlSlot]){
	player = asigndPlSlot;
}

var cursor = instance_place(x, y, oCharSelCursor);

var cursor_x = 0;
var cursor_y = 0;

var pl = player;
var keySel = false;
var keyDec = false;
with (oCharSelCursor){
	if (player == pl || pl < 0){
		cursor_x = x;
		cursor_y = y;
		keySel = keySelect;
		keyDec = keyDecline;
	}
}

selected = !isGrabbed;

if (cursor != noone && slot != noone) {
    if (keySel) {
        if (isGrabbed) {
            if (player < 0) global.cpus -= 1;
            else global.players -= 1;
			global.playerChar[asigndPlSlot] = 0;
			isSelected = false;
        } else {
            if (player < 0) global.cpus += 1;
            else global.players += 1;
			global.playerChar[asigndPlSlot] = char;
			isSelected = true;
        }
    }
}

if(isGrabbed){
	x = cursor_x;
	y = cursor_y;
}

if(keyDec && global.playerChar[asigndPlSlot] > 0){
	if (player < 0) global.cpus -= 1;
	else global.players -= 1;
	global.playerChar[asigndPlSlot] = 0;
}

if(global.currentMode == modes.story || global.currentMode == modes.challenge){
	if(global.players > 0 || global.cpus > 0) canStart = true;
	else canStart = false;
} else if (global.currentMode == modes.vs || global.currentMode == modes.training){
	if(global.players > 1 || global.cpus > 1 || (global.players > 0 && global.cpus > 0)) canStart = true;
	else canStart = false;
}

if(canStart){
	if(global.keyPause2[asigndPlSlot]){
		if(global.arcadeMode) global.existentPl = global.players;
		else global.existentPl = global.players + global.cpus;
		initInGameMode(global.currentMode);
	}
}