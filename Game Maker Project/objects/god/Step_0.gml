/// @description  @description debug
window_set_caption(string(fps));

if(keyboard_check_pressed(ord("Z")) && room != title/* || gamepad_button_check_pressed(0, gp_start) || gamepad_button_check_pressed(1, gp_start)*/){
    audio_stop_all();
    instance_destroy(oHurtbox);
    instance_destroy(oHitbox);
    with (oPlayer) instance_destroy();
	room_goto(title);
}

if(keyboard_check_pressed(vk_escape)){
    game_end();
}

if(keyboard_check_pressed(vk_space)){
    camLock = !camLock;
}

if(room != results && room != title && room != init ){
	with(oPlayer){
	    if(pause && !pauseHold){
	        if(!god.isPaused){
	            god.isPaused = true;
	            global.plPause = player;
	            god.gameSpeed = 0;
	        } else if (god.isPaused && global.plPause == player){
	            god.isPaused = false;
	            global.plPause = 0;
	            god.gameSpeed = 1;
	        }
        
	    }
	}

	//change weapon
	if(keyboard_check_pressed(vk_lcontrol)){
	    with(oPlayer){
	        if(player == 0){
	            weapon ++;
	            if(weapon > weapons.axe){
	                weapon = 0;
	            }
	        }
	    }
	}

	//show boxes
	if(keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(0, gp_select) || gamepad_button_check_pressed(1, gp_select)){
	    showBox = !showBox;
	}

	var human_players_count = 0;
	var cpu_enemies_count = 0;

	with (oPlayer) {
	    if (player >= 0) {
	        human_players_count += 1;
	    } else {
	        cpu_enemies_count += 1;
	    }
	}

	var is_created = ds_map_find_value(global.enemies_created_check, room_get_name(room));

	if (is_created && cpu_enemies_count == 0 && human_players_count >= 1) 
	{
	    var current_room_name = room_get_name(room);

	    if (global.room_status_map[? current_room_name] != true)
	    {
	        global.room_status_map[? current_room_name] = true;
	    }
	}

	//System

	if(global.opTimer) timer -= 1 * gameSpeed;

	var realPlayerDead = false;

	with (oPlayer) {
	    if(hp <= 0){
	        if (player >= 0) realPlayerDead = true;
	        instance_destroy(hitbox);
	        instance_destroy();
	    }
    
	}

	if ((global.existentPl <= 1 && !global.arcadeMode) || global.arPlWon || (global.opTimer && timer <= 0) || realPlayerDead) {
	    audio_stop_all();
	    instance_destroy(oHurtbox);
	    instance_destroy(oHitbox);
	    with (oPlayer) instance_destroy();
	    room_goto(results);
	}

	var is_cleared = ds_map_find_value(global.room_status_map, room_get_name(room));

	if(is_cleared){
	    with (oDoor) open = true;
	}
	/* */
	/*  */

}