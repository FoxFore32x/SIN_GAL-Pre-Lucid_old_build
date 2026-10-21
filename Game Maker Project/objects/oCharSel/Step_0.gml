/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var used = array_create(5, false);

for (var i = 0; i < 4; i++)
{
    // Active if gamepad connected OR pressed a button
    if (gamepad_is_connected(i) || global.keyAny[i])
    {
        isPActive[i] = true;
    }

    // CPU if inactive
    isPCPU[i] = !isPActive[i];
}


for(var i = 0; i < 4; i++){
	
	if (isPActive[i]) {

	    var move = global.keyRight2[i] - global.keyLeft2[i];

	    var oldPos = pos[i];
	    var newPos = oldPos + move;

	    // Wrap around
	    if (newPos >= 4) newPos = 0;
	    if (newPos < 0) newPos = 3;

	    // Find player occupying destination
	    var collision = -1;

	    for (var j = 0; j < 4; j++) {
	        if (j != i && isPActive[j] && pos[j] == newPos) {
	            collision = j;
	            break;
	        }
	    }

	    // Skip occupied position in the direction we're moving
	    if (collision != -1) {
	        newPos += move;

	        if (newPos >= 4) newPos = 0;
	        if (newPos < 0) newPos = 3;
	    }

	    pos[i] = newPos;

	    // Character selection
	    if (!isPSelected[pos[i]]) {
	        sel[pos[i]] += global.keyDown2[i] - global.keyUp2[i];

	        if (sel[pos[i]] >= 4) sel[pos[i]] = 0;
	        if (sel[pos[i]] < 0) sel[pos[i]] = 3;
	    }

	    used[pos[i]] = true;

		/*while (used[pos[i]]){
			pos[i]++;
		
			if(pos[i] >= 4) pos[i] = 0;
		}*/
	
		used[pos[i]] = true;

		var _pAccept = global.keyJump2[i];
		var _pDecline = global.keyLight2[i];

		if (_pAccept){
			isPSelected[pos[i]] = true;
			global.playerChar[pos[i]] = sel[pos[i]];
			if(isPCPU[pos[i]]) global.cpus++;
			else global.players++;
		}
		if (_pDecline){
			isPSelected[pos[i]] = false;
			global.playerChar[pos[i]] = 0;
			if(isPCPU[pos[i]]) global.cpus--;
			else global.players--;
		}
	}

	if(isPSelected[pos[i]]){
		ready = true;
		
		if(global.keyPause[i]){
			if(global.arcadeMode) global.existentPl = global.players;
			else global.existentPl = global.players + global.cpus;
			initInGameMode(global.currentMode);
		}
	}
}