global.currentMusic = sndTest;
if(global.opMusic == true){
	audio_play_sound(global.currentMusic, 0, 1);
}

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

if(global.cpus > 0){

    for (var i = 0; i < global.cpus; i++) {
    
        p1[i] = instance_create(dist, 80, oPlayer);
        p1[i].player = -(i + 1); // -1, -2, -3, -4
        p1[i].plId = ids;
        global.playerId[ids] = p1[i];

        dist += 64;
        ids++;
        
    }
}