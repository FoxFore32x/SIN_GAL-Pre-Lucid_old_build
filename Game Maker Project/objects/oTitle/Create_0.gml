controlsSetup();

global.playerId[0] = 0;
global.playerId[1] = 0;
global.playerId[2] = 0;
global.playerId[3] = 0;

global.arPlCreated = false;
global.uLostLmao = false;

global.players = 0;
global.cpus = 0;

global.room_status_map = ds_map_create();
global.enemies_created_check = ds_map_create();

//buttons
up    = false;
down  = false;
left  = false;
right = false;
    
leftHold  = left;
rightHold = right;
upHold    = up;
downHold  = down;

dt_buffer = 0;

dt_left_timer  = -1;
dt_right_timer = -1;
dt_up_timer    = -1;
dt_down_timer  = -1;

leftDouble  = false;
rightDouble = false;
upDouble    = false;
downDouble  = false;
    
jump  = false;
jumpHold = false;
    
attack = false;
attackHold = false;
    
//Attack btns
lowAt = false;
lowAtHold = false;
    
hiAt = false;
hiAtHold = false;
    
spBtHold = false;
spBt = false;
    
dash = false;
dashHold = false;
    
parry = false;
parryHold = false;
    
item = false;
itemHold = false;

pause = false;
pauseHold = false;

width = 256;
height = 256;

op_border = 8;
op_space = 48;

pos = 0;
playerPos = 1;

//Pause Menu
option[0, 0] = "Arcade";
option[0, 1] = "VS Mode";
option[0, 2] = "Training";
option[0, 3] = "Settings";
option[0, 4] = "Quit Game";

//Settings Menu
/*option[1, 0] = "Players";
option[1, 1] = "CPUs";*/
option[1, 0] = "Health";
option[1, 1] = "Timer";
option[1, 2] = "Music";
option[1, 3] = "SFX";
option[1, 4] = "Keybinds";
option[1, 5] = "Back";

//Keybind Menu
option[2, 0] = "Player";
option[2, 1] = "Left";
option[2, 2] = "Right";
option[2, 3] = "Up";
option[2, 4] = "Down";
option[2, 5] = "Jump";
option[2, 6] = "Light Attack";
option[2, 7] = "Heavy Attack";
option[2, 8] = "Block";
option[2, 9] = "Grab";
option[2, 10] = "Back";

//Setting Values

/*settVal[0] = global.players;
settVal[1] = global.cpus;*/
settVal[0, 0] = global.opHp;
settVal[0, 1] = global.opTimer;
settVal[0, 2] = global.volMusic;
settVal[0, 3] = global.volSfx;

settVal[1, 0] = 0;
settVal[1, 1] = chr(keybindMap[$ "up" + string(playerPos)]);
settVal[1, 2] = chr(keybindMap[$ "up" + string(playerPos)]);
settVal[1, 3] = chr(keybindMap[$ "up" + string(playerPos)]);

global.arPlWon = false;

op_length = array_length(option);
val_length = array_length(settVal);
menu_level = 0;

showCtrl = false;

player = 0;

global.currentMusic = sndMenu;

if(global.opMusic == true) { audio_play_sound(global.currentMusic, 0, 1, global.volMusic); }
else audio_stop_all();
