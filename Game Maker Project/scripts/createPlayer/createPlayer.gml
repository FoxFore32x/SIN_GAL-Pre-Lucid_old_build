/// @description  createPlayer(my penis hurts)
/// @param my penis hurts
function createPlayer(argument0, argument1) {

	if(global.arPlCreated == true) exit;
	
	global.existentPl = global.players;

	var dist = argument0;

	var ids = 0;
	if(global.players > 0){
	    for(var i = 0; i < global.players; i++){
        
	        p[i] = instance_create(dist, argument1, oPlayer);
	        p[i].depth = -50;
	        p[i].player = i;
	        p[i].plId = ids;
	        global.playerId[ids] = p[i];
        
	        dist += 64;
	        ids++;
	    }
	    global.arPlCreated = true;

	}



}
