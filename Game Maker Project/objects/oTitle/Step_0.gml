pos += (down && !downHold) - (up && !upHold);

op_length = array_length_2d(option, menu_level);

if (pos >= op_length)
{
    pos = 0;
}
if (pos < 0)
{
    pos = op_length-1;
}

var btnJump = (jump2);

var _sml = menu_level;

switch(menu_level){
    case 0:
        if(btnJump){
            switch(pos){
                case 0:
					global.currentMode = modes.story
					room_goto(rm_charsel);
				break;
                case 1:
					global.currentMode = modes.vs
					room_goto(rm_charsel);
				break;
                case 2: 
					global.currentMode = modes.training
					room_goto(rm_charsel);
				break;
                case 3: menu_level = 1; break;
                case 4: game_end(); break;
            }
        }
    break;
        
    case 1:
        var change = (right && !rightHold) - (left && !leftHold);
        var total = settVal[0] + settVal[1];

        switch (pos) {
            // PLAYER COUNT
            case 0:
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
            break;
            
            // HP SETTING
            case 2:
                if (change != 0) {
                    if (settVal[2] == false) settVal[2] = true;
                    else settVal[2] = false;
                }
            break;
            
            // TIMER SETTING
            case 3:
                if (change != 0) {
                    if (settVal[3] == false) settVal[3] = true;
                    else settVal[3] = false;
                }
            break;
            
            // MUSIC SETTING
            case 4:
                if (change != 0) {
					settVal[4] += (change * 0.1);
					if(settVal[4] > 0){
						global.opMusic = true;
					}
					else global.opMusic = false;
					
					if (settVal[4] < 0) settVal[4] = 0;
					if (settVal[4] > global.maxVolMusic) settVal[4] = global.maxVolMusic;
					
					audio_sound_gain(global.currentMusic, settVal[4]);
					
                    if (global.opMusic == true && !audio_is_playing(global.currentMusic)) {
                        audio_play_sound(global.currentMusic, 0, 1);
                    }
                    else if (global.opMusic == false && audio_is_playing(global.currentMusic)) {
                        audio_stop_sound(global.currentMusic);
                    }
                }
            break;
            
            // SFX SETTING
            case 5:
				if (change != 0) {
					settVal[5] += (change * 0.1);
					if(settVal[5] > 0) global.opSfx = true;
					else global.opSfx = false;
					
					if (settVal[5] < 0) settVal[5] = 0;
					if (settVal[5] > global.maxVolSfx) settVal[5] = global.maxVolSfx;
                }
            break;

            // BACK
            case 6:
                if (btnJump){
                    global.players = settVal[0];
                    global.cpus = settVal[1];
                    global.opHp = settVal[2];
                    global.opTimer = settVal[3];
                    global.volMusic = settVal[4];
                    global.volSfx = settVal[5];
                    menu_level = 0;
                }
            break;
        }

        // recompute total at end
        global.balancer = settVal[0] + settVal[1];
        
    break;
}

// Proper back handling
if (menu_level == 1 && lowAt && !lowAtHold){
    global.players	= settVal[0];
    global.cpus		= settVal[1];
    global.opHp		= settVal[2];
    global.opTimer	= settVal[3];
    global.volMusic	= settVal[4];
    global.volSfx	= settVal[5];

    menu_level = 0;
    pos = 0;
}

if (pos >= op_length) pos = 0;

if(btnJump){
    if _sml != menu_level {pos = 0};
    op_length = array_length(option);
}

if(keyboard_check_pressed(ord("Z"))) showCtrl = !showCtrl;
