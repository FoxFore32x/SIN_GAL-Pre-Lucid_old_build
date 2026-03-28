/// @description  play_sfx(sfx, priority, loop)
/// @param sfx
/// @param  priority
/// @param  loop
function play_sfx(argument0, argument1, argument2) {
	var sfx = argument0;
	var priority = argument1;
	var loop = argument2;

	if (global.opSfx) {
		audio_sound_gain(sfx, global.volSfx);
	    audio_play_sound(sfx, priority, loop);
	}




}
