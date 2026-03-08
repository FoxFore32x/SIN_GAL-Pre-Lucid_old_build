audio_stop_sound(sndLevel);
if(global.opMusic == true){ if(!audio_is_playing(sndTest)) audio_play_sound(sndTest, 0, 1); }

global.winId[0] = 0;
global.winId[1] = 0;
global.winId[2] = 0;
global.winId[3] = 0;
global.winnerVar = 0;

global.arcadeMode = false;
var dist = 160;

var ids = global.players; // continue numbering after players

p1 = instance_create(dist, 80, oPlayer);
p1.player = -1; // -1, -2, -3, -4
p1.plId = ids;
global.playerId[ids] = p1;
ids++;