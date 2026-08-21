
if(!readingKeybind) pos += ((down && !downHold) - (up && !upHold));
var change = (right && !rightHold) - (left && !leftHold);

op_length = array_length_2d(option, menu_level);

if (pos >= op_length)
{
    pos = 0;
}
if (pos < 0)
{
    pos = op_length-1;
}

var btnJump = (jump2 || pause2);
var btnJumpRelease = (jumpRel || pauseRel);

var _sml = menu_level;

var keybindFinished = false;

switch(menu_level){
    case 0:
        if(btnJump){
            switch(pos){
                case 0:
					global.currentMode = modes.story;
					room_goto(rm_charsel);
				break;
                case 1:
					global.currentMode = modes.vs;
					room_goto(rm_charsel);
				break;
                case 2: 
					global.currentMode = modes.training;
					room_goto(rm_charsel);
				break;
                case 3: menu_level = 1; break;
                case 4: game_end(); break;
            }
        }
    break;
        
    case 1:
        //var total = settVal[0] + settVal[1];

        switch (pos) {
            // PLAYER COUNT
            /*case 0:
                if (change != 0) {
                    settVal[0] += change;
                    if (settVal[0] < 0) settVal[0] = 0;
                    if (settVal[0] > global.maxPlayers) settVal[0] = global.maxPlayers;
                    
                    // auto-balance: keep total within maxPlayers
                    if (settVal[0] + settVal[1] > global.maxPlayers)
                        settVal[1] = global.maxPlayers - settVal[0];
                }
            break;
            
            // CPU COUNT
            case 1:
                if (change != 0) {
                    settVal[1] += change;
                    if (settVal[1] < 0) settVal[1] = 0;
                    if (settVal[1] > global.maxPlayers) settVal[1] = global.maxPlayers;
                    
                    // auto-balance
                    if (settVal[0] + settVal[1] > global.maxPlayers)
                        settVal[0] = global.maxPlayers - settVal[1];
                }
            break;*/
            
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
					settVal[2] += (change * 0.1);
					if(settVal[2] > 0){
						global.opMusic = true;
					}
					else global.opMusic = false;
					
					if (settVal[2] < 0) settVal[2] = 0;
					if (settVal[2] > global.maxVolMusic) settVal[2] = global.maxVolMusic;
					
					audio_sound_gain(global.currentMusic, settVal[2]);
					
                    if (global.opMusic == true && !audio_is_playing(global.currentMusic)) {
                        audio_play_sound(global.currentMusic, 0, 1);
                    }
                    else if (global.opMusic == false && audio_is_playing(global.currentMusic)) {
                        audio_stop_sound(global.currentMusic);
                    }
                }
            break;
            
            // SFX SETTING
            case 3:
				if (change != 0) {
					settVal[3] += (change * 0.1);
					if(settVal[3] > 0) global.opSfx = true;
					else global.opSfx = false;
					
					if (settVal[3] < 0) settVal[3] = 0;
					if (settVal[3] > global.maxVolSfx) settVal[3] = global.maxVolSfx;
                }
            break;

            // KEYBINDS
            case 4:
               if (btnJump) {
				   keybindWaitRelease = true;
				   menu_level = 2;
			   }
            break;
			
			// BACK
			case 5:
                if (btnJump){
                    /*global.players = settVal[0];
                    global.cpus = settVal[1];*/
                    global.opHp = settVal[1, 0];
                    global.opTimer = settVal[1, 1];
                    global.volMusic = settVal[1, 2];
                    global.volSfx = settVal[1, 3];
                    menu_level = 0;
                }
            break;
        }

        // recompute total at end
       // global.balancer = settVal[0] + settVal[1];
	
	case 2:
		if (keybindWaitRelease) {
			if (btnJumpRelease) {
				keybindWaitRelease = false;
			}
		} else {
			if (!keybindWaitRelease && (pos >= 1 && pos < 11) &&  (btnJump && !readingKeybind)){
				readingKeybind = true;
				keybindWaitRelease = true;
			}
		switch(pos){
			
			case 0:
				if (change != 0){
					playerPos += change;
					settVal[2, 0] += change;
					settVal[2, 1] = chr(oInput.keybindMap[$ "left" + string(playerPos)][0].key);
					settVal[2, 2] = chr(oInput.keybindMap[$ "right" + string(playerPos)][0].key);
					settVal[2, 3] = chr(oInput.keybindMap[$ "up" + string(playerPos)][0].key);
					settVal[2, 4] = chr(oInput.keybindMap[$ "down" + string(playerPos)][0].key);
					settVal[2, 5] = chr(oInput.keybindMap[$ "jump" + string(playerPos)][0].key);
					settVal[2, 6] = chr(oInput.keybindMap[$ "light" + string(playerPos)][0].key);
					settVal[2, 7] = chr(oInput.keybindMap[$ "strong" + string(playerPos)][0].key);
					settVal[2, 8] = chr(oInput.keybindMap[$ "block" + string(playerPos)][0].key);
					settVal[2, 9] = chr(oInput.keybindMap[$ "special" + string(playerPos)][0].key);
					settVal[2, 10] = chr(oInput.keybindMap[$ "pause" + string(playerPos)][0].key);
				}
				
			break;
			case 1:
				if (readingKeybind == true){
					settVal[2, 1] = "...";
					
					if (keybindWaitRelease) {
				        if (btnJumpRelease) {
				            keybindWaitRelease = false;
				        }
				    } else {
						if(keyboard_check_pressed(vk_anykey)){
							var _newKeybind = inputChangeKeybind("left" + string(playerPos), playerPos - 1);
							if(_newKeybind != -1){
								inputReplace("left" + string(playerPos), _newKeybind);
								settVal[2, 1] = chr(oInput.keybindMap[$ "left" + string(playerPos)][0].key);
								readingKeybind = false;
								keybindFinished = true;
							}
						}
					}
				}
			break;
			case 2: 
				if (readingKeybind == true){
					settVal[2, 2] = "...";
					
					if (keybindWaitRelease) {
				        if (btnJumpRelease) {
				            keybindWaitRelease = false;
				        }
				    } else {
						if(keyboard_check_pressed(vk_anykey)){
							var _newKeybind = inputChangeKeybind("right" + string(playerPos), playerPos - 1);
							if(_newKeybind != -1){
								inputReplace("right" + string(playerPos), _newKeybind);
								settVal[2, 2] = chr(oInput.keybindMap[$ "right" + string(playerPos)][0].key);
								readingKeybind = false;
								keybindFinished = true;
							}
						}
					}
				}
			break;
			case 3: 
				if (readingKeybind == true){
					settVal[2, 3] = "...";
					
					if (keybindWaitRelease) {
				        if (btnJumpRelease) {
				            keybindWaitRelease = false;
				        }
				    } else {
						if(keyboard_check_pressed(vk_anykey)){
							var _newKeybind = inputChangeKeybind("up" + string(playerPos), playerPos - 1);
							if(_newKeybind != -1){
								inputReplace("up" + string(playerPos), _newKeybind);
								settVal[2, 3] = chr(oInput.keybindMap[$ "up" + string(playerPos)][0].key);
								readingKeybind = false;
								keybindFinished = true;
							}
						}
					}
				}
			break;
			case 4:
				if (readingKeybind == true){
					settVal[2, 4] = "...";
					
					if (keybindWaitRelease) {
				        if (btnJumpRelease) {
				            keybindWaitRelease = false;
				        }
				    } else {
						if(keyboard_check_pressed(vk_anykey)){
							var _newKeybind = inputChangeKeybind("down" + string(playerPos), playerPos - 1);
							if(_newKeybind != -1){
								inputReplace("down" + string(playerPos), _newKeybind);
								settVal[2, 4] = chr(oInput.keybindMap[$ "down" + string(playerPos)][0].key);
								readingKeybind = false;
								keybindFinished = true;
							}
						}
					}
				}
			break;
			case 5: 
				if (readingKeybind == true){
					settVal[2, 5] = "...";
					
					if (keybindWaitRelease) {
				        if (btnJumpRelease) {
				            keybindWaitRelease = false;
				        }
				    } else {
						if(keyboard_check_pressed(vk_anykey)){
							var _newKeybind = inputChangeKeybind("jump" + string(playerPos), playerPos - 1);
							if(_newKeybind != -1){
								inputReplace("jump" + string(playerPos), _newKeybind);
								settVal[2, 5] = chr(oInput.keybindMap[$ "jump" + string(playerPos)][0].key);
								readingKeybind = false;
								keybindFinished = true;
							}
						}
					}
				}
			break;
			case 6:
				if (readingKeybind == true){
					settVal[2, 6] = "...";
					
					if (keybindWaitRelease) {
				        if (btnJumpRelease) {
				            keybindWaitRelease = false;
				        }
				    } else {
						if(keyboard_check_pressed(vk_anykey)){
							var _newKeybind = inputChangeKeybind("light" + string(playerPos), playerPos - 1);
							if(_newKeybind != -1){
								inputReplace("light" + string(playerPos), _newKeybind);
								settVal[2, 6] = chr(oInput.keybindMap[$ "light" + string(playerPos)][0].key);
								readingKeybind = false;
								keybindFinished = true;
							}
						}
					}
				}
			break;
			case 7:
				if (readingKeybind == true){
					settVal[2, 7] = "...";
					
					if (keybindWaitRelease) {
				        if (btnJumpRelease) {
				            keybindWaitRelease = false;
				        }
				    } else {
						if(keyboard_check_pressed(vk_anykey)){
							var _newKeybind = inputChangeKeybind("strong" + string(playerPos), playerPos - 1);
							if(_newKeybind != -1){
								inputReplace("strong" + string(playerPos), _newKeybind);
								settVal[2, 7] = chr(oInput.keybindMap[$ "strong" + string(playerPos)][0].key);
								readingKeybind = false;
								keybindFinished = true;
							}
						}
					}
				}
			break;
			case 8:
				if (readingKeybind == true){
					settVal[2, 8] = "...";
					
					if (keybindWaitRelease) {
				        if (btnJumpRelease) {
				            keybindWaitRelease = false;
				        }
				    } else {
						if(keyboard_check_pressed(vk_anykey)){
							var _newKeybind = inputChangeKeybind("block" + string(playerPos), playerPos - 1);
							if(_newKeybind != -1){
								inputReplace("block" + string(playerPos), _newKeybind);
								settVal[2, 8] = chr(oInput.keybindMap[$ "block" + string(playerPos)][0].key);
								readingKeybind = false;
								keybindFinished = true;
							}
						}
					}
				}
			break;
			case 9:
				if (readingKeybind == true){
					settVal[2, 9] = "...";
					
					if (keybindWaitRelease) {
				        if (btnJumpRelease) {
				            keybindWaitRelease = false;
				        }
				    } else {
						if(keyboard_check_pressed(vk_anykey)){
							var _newKeybind = inputChangeKeybind("special" + string(playerPos), playerPos - 1);
							if(_newKeybind != -1){
								inputReplace("special" + string(playerPos), _newKeybind);
								settVal[2, 9] = chr(oInput.keybindMap[$ "special" + string(playerPos)][0].key);
								readingKeybind = false;
								keybindFinished = true;
							}
						}
					}
				}
			break;
			case 10: 
				if (readingKeybind == true){
					settVal[2, 10] = "...";
					
					if (keybindWaitRelease) {
				        if (btnJumpRelease) {
				            keybindWaitRelease = false;
				        }
				    } else {
						if(keyboard_check_pressed(vk_anykey)){
							var _newKeybind = inputChangeKeybind("pause" + string(playerPos), playerPos - 1);
							if(_newKeybind != -1){
								inputReplace("pause" + string(playerPos), _newKeybind);
								settVal[2, 10] = chr(oInput.keybindMap[$ "pause" + string(playerPos)][0].key);
								readingKeybind = false;
								keybindFinished = true;
							}
						}
					}
				}
			break;
			case 11: if (btnJump) menu_level = 1;
		}
		}
	break;
}

// Proper back handling
if (menu_level >= 1 && (lowAt && !lowAtHold) && !readingKeybind && !keybindFinished){
    /*global.players	= settVal[0];
    global.cpus		= settVal[1];*/
	if(menu_level == 1){
	    global.opHp		= settVal[1, 0];
	    global.opTimer	= settVal[1, 1];
	    global.volMusic	= settVal[1, 2];
	    global.volSfx	= settVal[1, 3];
	}
    menu_level--;
    pos = 0;
}

if (pos >= op_length) pos = 0;

if(btnJump){
    if _sml != menu_level {pos = 0};
    op_length = array_length(option);
}

if(keyboard_check_pressed(ord("Z"))) showCtrl = !showCtrl;
