// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function spawnChars(_x, _y){

	if(global.arcadeMode){
		if(global.arPlCreated == true) exit;
	
		global.existentPl = global.players;
	}
	
	var dist = _x;

	var ids = 0;
	if(global.players > 0){
	    for(var i = 0; i < global.players; i++){
        
			if(global.playerChar[i] != 0){
		        p[i] = instance_create(dist, _y, oPlayer);
				p[i].depth = -50;
		        p[i].player = i;
		        p[i].plId = ids;
				p[i].character = global.playerChar[ids];
				with (p[i]) {
				    pl_setCharStats();
				}
		        global.playerId[ids] = p[i];
        
		        dist += 64;
			}
	        ids++;
	    }
		
		if(global.arcadeMode) global.arPlCreated = true;
	}

	if(!global.arcadeMode && global.cpus > 0){

	    for (var i = 0; i < global.cpus; i++) {
    
			if(global.playerChar[i] != 0){
		        p1[i] = instance_create(dist, _y, oPlayer);
				p1[i].depth = -50;
		        p1[i].player = -(i + 1); // -1, -2, -3, -4
		        p1[i].plId = ids;
				p1[i].character = global.playerChar[ids];
				with (p1[i]) {
				    pl_setCharStats();
				}
		        global.playerId[ids] = p1[i];

		        dist += 64;
			}
	        ids++;
        
	    }
	}
}