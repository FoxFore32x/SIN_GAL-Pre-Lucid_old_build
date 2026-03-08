audio_stop_sound(sndTutorial);
if(global.opMusic == true && !audio_is_playing(sndLevel)){ audio_play_sound(sndLevel, 0, 1); }