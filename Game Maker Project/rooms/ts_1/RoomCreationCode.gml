global.currentMusic = sndTutorial;
audio_sound_gain(global.currentMusic, global.volMusic);
if(global.opMusic == true && !audio_is_playing(global.currentMusic)){
	audio_play_sound(global.currentMusic, 0, 1);
}

createPlayer(128, 1344);