controlsSetup();

global.playerId[0] = 0;
global.playerId[1] = 0;
global.playerId[2] = 0;
global.playerId[3] = 0;

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

width = 256;
height = 256;

op_border = 8;
op_space = 48;

pos = 0;

//Pause Menu
option[0, 0] = "Teori";
option[0, 1] = "Lamb Bisquit";

//Setting Values

settVal[0] = characters.teori;
settVal[1] = characters.lamb;

op_length = array_length(option);
val_length = array_length(settVal);
menu_level = 0;
