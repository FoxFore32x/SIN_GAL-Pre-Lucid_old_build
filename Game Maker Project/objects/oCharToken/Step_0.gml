var slot = instance_place(x, y, oCharSlot);
if(slot != noone) char = slot.character;

if (global.keyAny[asigndPlSlot]){
	player = asigndPlSlot;
}

var cursor = instance_place(x, y, oCharSelCursor);

if(isGrabbed){
	global.playerChar[asigndPlSlot] = 0;
	
	if(cursor != noone && (cursor.player == player || cursor.player < 0)){
		x = cursor.x;
		y = cursor.y;
		
		if(slot != noone && global.keyJump3[asigndPlSlot]){
			if (player < 0) global.cpus--;
			else global.players--;
		}
	}
} else {
	if(cursor != noone && (cursor.player == player || cursor.player < 0)){
		global.playerChar[asigndPlSlot] = char;
		if(slot != noone && global.keyJump3[asigndPlSlot]){
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