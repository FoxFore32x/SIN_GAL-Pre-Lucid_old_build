controlsSetup();

global.playerId[0] = 0;
global.playerId[1] = 0;
global.playerId[2] = 0;
global.playerId[3] = 0;

global.arcadeMode = false;
global.arPlCreated = false;
global.uLostLmao = false;

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

jump2 = false;
jumpHold2 = false;
    
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

isVideoPlaying = false;

debug = false;

section = 0;
sectionTimeMax[0] = 200;
sectionTimeMax[1] = -1;
sectionTimeMax[2] = 600;
sectionTimeMax[3] = 1200;
sectionTime = 200;
creditTxtTimerMax = 150;
creditTxtTimer = 0;
fadeLevel = 0.1;
_vidPos = -1;
_vidDur = -1;
_vidStatus = -1;
_videoData = -1;
_videoStatus = -1;
vidCheck = false;
video_sampler = 0;
video_width = 640;
video_height = 480;