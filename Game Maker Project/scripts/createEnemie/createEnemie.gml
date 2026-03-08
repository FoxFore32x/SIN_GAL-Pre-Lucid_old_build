/// @description  createEnemie(quantity, dist, y)
/// @param quantity
/// @param  dist
/// @param  y
function createEnemie(argument0, argument1, argument2) {
	var is_created = ds_map_find_value(global.enemies_created_check, room_get_name(room));
	var is_cleared = ds_map_find_value(global.room_status_map, room_get_name(room));

	if(!is_cleared){
	    global.cpus = argument0;
    
	    var dist = argument1;
	    var ids = global.players; // continue numbering after players
    
	    for (var i = 0; i < global.cpus; i++){
	        var inst = instance_create(dist, argument2, oPlayer);
    
	        inst.player = -(i + 1); // -1, -2, -3...
	        inst.plId   = ids;      // unique ID
	        inst.depth = -40;
	        inst.hp     = 300;
    
	        global.playerId[ids] = inst;
    
	        dist += 128;
	        ids++;
	        global.existentPl++;
	    }
	    var current_room_name = room_get_name(room);
    
	    if (global.enemies_created_check[? current_room_name] != true)
	    {
	        global.enemies_created_check[? current_room_name] = true;
	    }
	}



}
