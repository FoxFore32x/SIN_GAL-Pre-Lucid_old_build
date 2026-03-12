script_execute(god_create,0,0,0,0,0);

isTrapped = false;

op_border = 8;
op_space = 48;

pos = 0;

btnJump = 0;
btnBack = 0;
change = 0;

//Pause Menu
option[0, 0] = "Continue";
option[0, 1] = "Settings";
option[0, 2] = "Return to da Menu (pussy)";

//Settings Menu
option[1, 0] = "Health";
option[1, 1] = "Timer";
option[1, 2] = "Music";
option[1, 3] = "SFX";
option[1, 4] = "Back";

settVal[0] = global.opHp;
settVal[1] = global.opTimer;
settVal[2] = global.opMusic;
settVal[3] = global.opSfx;

op_length = array_length(option);
val_length = array_length(settVal);
menu_level = 0;

camLock = 0;
