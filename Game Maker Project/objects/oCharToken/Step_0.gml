var slot = instance_place(x, y, oCharSlot);
if(slot != noone) char = slot.character;

if (global.keyAny[asigndPlSlot]){
	player = asigndPlSlot;
}

var cursor = instance_place(x, y, oCharSelCursor);

var cursor_x = 0;
var cursor_y = 0;

var pl = player;
with (oCharSelCursor){
	if (player == pl || player < 0){
		cursor_x = x;
		cursor_y = y;
	}
}

if(isGrabbed){
	global.playerChar[asigndPlSlot] = 0;
	
	x = cursor_x;
	y = cursor_y;
	
	if(cursor != noone && (cursor.player == player || cursor.player < 0)){
		
		if(slot != noone && global.keyJump2[asigndPlSlot]){
			if (player < 0) global.cpus--;
			else global.players--;
		}
	}
} else {
	if(cursor != noone && (cursor.player == player || cursor.player < 0)){
		global.playerChar[asigndPlSlot] = char;
		if(slot != noone && global.keyJump2[asigndPlSlot]){
			if (player < 0) global.cpus++;
			else global.players++;
		}
	}
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