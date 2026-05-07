timeLimit = 700;
time = timeLimit;

distLimit = 300;
dist = distLimit;

parried = false;

xDir = 0;
yDir = 0;
spd = 0;

hitbox  = -1; //default hitbox variable

dur     = 0; //number of frames the hitbox is active
xHit    = 0; //horizontal knock back
yHit    = 0; //vertical knock back
hitStun = 0; //hit stun duration
damage  = 0; //damage dealt
invincible = false; //what it sounds like
comboGranted = false; //it's for tracking a single hit when hitting all players

hitQueue = ds_list_create();

hitbox_create(0, 0, sprite_width, sprite_height, 10000000000000000, 80, 80, 60, 60);