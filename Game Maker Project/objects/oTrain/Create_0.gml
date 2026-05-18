timeLimit = 700;
trainTime = timeLimit;

distLimit = 300;
dist = distLimit;

parried = false;

initX = x;
initY = y;

xDir = 0;
yDir = 0;
spd = 0;

xHit = 15;
yHit = -30;

hitbox  = -1; //default hitbox variable

dur     = 0; //number of frames the hitbox is active
hitStun = 0; //hit stun duration
damage  = 0; //damage dealt
invincible = false; //what it sounds like
comboGranted = false; //it's for tracking a single hit when hitting all players
facing = 0;

isFrozen = false;
freeze = 0;
freezeStored = false;
xSpeed = 0;
ySpeed = 0;
tempXSpeed = 0;
tempYSpeed = 0;
frameSpeed = 0;

obstacle = true;
dissapears = false;