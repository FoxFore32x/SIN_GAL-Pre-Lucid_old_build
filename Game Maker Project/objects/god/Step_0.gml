/// @description  @description debug
window_set_caption(string(fps));

var _exit = 500;

if(keyboard_check(vk_escape)){
	_exit--;
	
	if(_exit <= 0) game_end();
}

if(keyboard_check_released(vk_escape)){
	_exit = 500;
}

if(keyboard_check_pressed(ord("Z")) && room != title/* || gamepad_button_check_pressed(0, gp_start) || gamepad_button_check_pressed(1, gp_start)*/){
    audio_stop_all();
    instance_destroy(oHurtbox);
    instance_destroy(oHitbox);
    with (oPlayer) instance_destroy();
	room_goto(title);
}

if(keyboard_check_pressed(vk_space)){
    camLock = !camLock;
}

if(room != results && room != title && room != init ){
	
	if(keyboard_check_pressed(vk_escape)){
	    game_end();
	}
	
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
		
		if(player == global.plPause && god.isPaused){
			god.pos += (down && !downHold) - (up && !upHold);
			god.btnJump = (jump2);
			god.change = (right && !rightHold) - (left && !leftHold);
			god.btnBack = lowAt && !lowAtHold;
		}
	}
	
	if(isPaused){
		op_length = array_length_2d(option, menu_level);
		
		if (pos >= op_length)
		{
		    pos = 0;
		}
		if (pos < 0)
		{
		    pos = op_length-1;
		}
		
		var _sml = menu_level;

		switch(menu_level){
		    case 0:
		        if(btnJump){
		            switch(pos){
		                case 0:
							pos = 0;
						    isPaused = false;
						    gameSpeed = 1;
						    global.plPause = 0;
						break;
		                case 1: menu_level = 1; break;
		                case 2:
							audio_stop_all();
							pos = 0;
							isPaused = false;
						    gameSpeed = 1;
						    global.plPause = 0;
						    instance_destroy(oHurtbox);
						    instance_destroy(oHitbox);
						    with (oPlayer) instance_destroy();
							room_goto(title);
						break;
		            }
		        }
		    break;
        
		    case 1:

		        switch (pos) {
		            // HP SETTING
		            case 0:
		                if (change != 0) {
		                    if (settVal[0] == false) settVal[0] = true;
		                    else settVal[0] = false;
		                }
		            break;
            
		            // TIMER SETTING
		            case 1:
		                if (change != 0) {
		                    if (settVal[1] == false) settVal[1] = true;
		                    else settVal[1] = false;
		                }
		            break;
            
		            // MUSIC SETTING
		            case 2:
		                if (change != 0) {
		                    if (settVal[2] == false) {
		                        settVal[2] = true;
		                        audio_play_sound(global.currentMusic, 0, 1);
		                    }
		                    else {
		                        settVal[2] = false;
		                        audio_stop_sound(global.currentMusic);
		                    }
		                }
		            break;
            
		            // SFX SETTING
		            case 3:
		                if (change != 0) {
		                    if (settVal[3] == false) settVal[3] = true;
		                    else settVal[3] = false;
		                }
		            break;

		            // BACK
		            case 4:
		                if (btnJump){
		                    global.opHp = settVal[0];
		                    global.opTimer = settVal[1];
		                    global.opMusic = settVal[2];
		                    global.opSfx = settVal[3];
		                    menu_level = 0;
		                }
		            break;
		        }
        
		    break;
		}

		// Proper back handling
		if (menu_level == 1 && btnBack){
		    global.opHp   = settVal[0];
		    global.opTimer= settVal[1];
		    global.opMusic= settVal[2];
		    global.opSfx  = settVal[3];

		    menu_level = 0;
		    pos = 0;
		}
		
		if (menu_level == 0 && btnBack){
			pos = 0;
			isPaused = false;
			gameSpeed = 1;
			global.plPause = 0;
		}

		if (pos >= op_length) pos = 0;

		if(btnJump){
		    if _sml != menu_level {pos = 0};
		    op_length = array_length(option);
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