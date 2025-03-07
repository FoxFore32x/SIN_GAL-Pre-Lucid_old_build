#ifndef INPUT_H
#define INPUT_H

#include <stdbool.h>

extern bool key_left, key_left2, key_right, key_right2, key_up, key_up2, key_down, key_down2, key_jump, key_jump2, key_jump3, key_run,
key_run2, key_run3, key_crouch, key_crouch2, key_crouch3, key_start, key_start2, key_start3, key_debug_stage_select, key_debug_stage_select2,
key_debug_stage_select3, key_test, key_exit, key_exit2, key_exit3, key_stickpressed;

extern int bufferTime, jumpKeyBuffered, jumpKeyBufferTimer;

void scr_getInput();

#endif