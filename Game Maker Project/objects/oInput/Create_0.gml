controlsSetup();
player = 0;

keybinds = [];

initialize_Keybinds();
globalKeys();

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
