global.currentMusic = sndTest;
audio_sound_gain(global.currentMusic, global.volMusic);
if(global.opMusic == true && !audio_is_playing(global.currentMusic)){
	audio_play_sound(global.currentMusic, 0, 1);
}

global.opHp = false;
global.opTimer = false;
global.arcadeMode = false;

var dist = 16

var ids = 0;
if(global.players > 0){
    for(var i = 0; i < global.players; i++){
        
        p[i] = instance_create(dist, 80, oPlayer);
        p[i].player = i;
        p[i].plId = ids;
        global.playerId[ids] = p[i];
        
        dist += 64;
        ids++;
    }
}

p1 = instance_create(dist, 80, oPlayer);
p1.player = 1;
p1.plId = ids;
global.playerId[ids] = p1;
ids++;