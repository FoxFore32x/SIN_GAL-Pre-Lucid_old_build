global.currentMusic = sndLevel;
if(global.opMusic == true && !audio_is_playing(global.currentMusic)){ audio_play_sound(global.currentMusic, 0, 1); }

createPlayer(192, 800);