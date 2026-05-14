audio_stop_sound(global.currentMusic);
global.currentMusic = sndTest;
audio_sound_gain(global.currentMusic, global.volMusic);
if(global.opMusic == true && !audio_is_playing(global.currentMusic)){
	audio_play_sound(global.currentMusic, 0, 1);
}

createEnemie(1, 672, 416);