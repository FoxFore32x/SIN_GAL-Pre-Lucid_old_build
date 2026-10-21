/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

ready = false;

//Initial player position
inPos[0] = 0;
inPos[1] = 1;
inPos[2] = 2;
inPos[3] = 3;

//player color
pCol[0] = c_red;
pCol[1] = c_blue;
pCol[2] = c_yellow;
pCol[3] = c_green;
pCol[4] = c_gray;

//player position
pos[0] = 0;
pos[1] = 1;
pos[2] = 2;
pos[3] = 3;

//Player is active
isPActive = array_create(5, false);

//CPU Checks for each pl
isPCPU = array_create(5, false);

//Is player selected
isPSelected = array_create(5, false);

//Characters
char[0] = "  ^\nNone\n  v";
char[1] = "   ^\nTeori\n   v";
char[2] = "		^\nLamb Bisquit\n	v";
char[3] = "		^\nMy uncle Jay,\nhe's so cool :)\n		v";

//Character renders
charImg[0] = sCharselNobody;
charImg[1] = sTeoriRender;
charImg[2] = sLambRender;
charImg[3] = sJayRender;

//Player Selected character
sel = array_create(5, 0);

// character assigned to each POSITION
selPos = array_create(5, 0);

//Player's current selected character
sel = array_create(5, 0);