#include <grrlib.h>
#include <ogc/video.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>
//#include <wiiuse/wpad.h>
#include <mp3player.h>
#include <stdio.h>
#include <asndlib.h>
#include <gctypes.h>
#include <gccore.h>

#include "input.h"
#include "../Scripts.h"

const int deadZone = 40;

// Define all the variables declared as extern in input.h
bool key_left = false;
bool key_left2 = false;
bool key_right = false;
bool key_right2 = false;
bool key_up = false;
bool key_up2 = false;
bool key_down = false;
bool key_down2 = false;
bool key_jump = false;
bool key_jump2 = false;
bool key_jump3 = false;
bool key_run = false;
bool key_run2 = false;
bool key_run3 = false;
bool key_crouch = false;
bool key_crouch2 = false;
bool key_crouch3 = false;
bool key_start = false;
bool key_start2 = false;
bool key_start3 = false;
bool key_debug_stage_select = false;
bool key_debug_stage_select2 = false;
bool key_debug_stage_select3 = false;
bool key_test = false;
bool key_exit = false;
bool key_exit2 = false;
bool key_exit3 = false;
bool key_stickpressed = false;
int bufferTime = 150;
int jumpKeyBuffered = 0;
int jumpKeyBufferTimer = 0;

void scr_getInput() {

    //WPAD_ScanPads();
    PAD_ScanPads(); // Update controller status

    /*expansion_t e;
    WPAD_Expansion(WPAD_CHAN_0, &e);

    u32 pressed = WPAD_ButtonsHeld(0);
    u32 Btndown = WPAD_ButtonsDown(0);
    u32 released = WPAD_ButtonsUp(0);*/

    // Directly get the button down state for this frame
    u16 BtndownGC = PAD_ButtonsDown(0); // This shows what buttons were just pressed down
    u16 pressedGC = PAD_ButtonsHeld(0);
    u16 releasedGC = PAD_ButtonsUp(0);

    // Get main control stick input
    s8 mainStickX = PAD_StickX(0); // Get X-axis position (-80 to 80)
    s8 mainStickY = PAD_StickY(0); // Get Y-axis position (-80 to 80)

    // LEFT KEYS

    key_left = (/*(Btndown & WPAD_BUTTON_UP) || (Btndown & WPAD_CLASSIC_BUTTON_LEFT) ||*/ (BtndownGC & PAD_BUTTON_LEFT) || (mainStickX < -deadZone)/* || (e.classic.ljs.pos.x < -deadZone)*/);
    key_left2 = (/*(pressed & WPAD_BUTTON_UP) || (pressed & WPAD_CLASSIC_BUTTON_LEFT) ||*/ (pressedGC & PAD_BUTTON_LEFT) || (mainStickX < -deadZone && key_stickpressed == true) /*|| (e.classic.ljs.pos.x < -deadZone && key.stickpressed == true)*/);
        key_left = clamp(key_left, 0 , 1);

    // RIGHT KEYS

    key_right = (/*(Btndown & WPAD_BUTTON_DOWN) || (Btndown & WPAD_CLASSIC_BUTTON_RIGHT) ||*/ (BtndownGC & PAD_BUTTON_RIGHT) || (mainStickX > deadZone)/* || (e.classic.ljs.pos.x > deadZone)*/);
    key_right2 = (/*(pressed & WPAD_BUTTON_DOWN) || (pressed & WPAD_CLASSIC_BUTTON_RIGHT) ||*/ (pressedGC & PAD_BUTTON_RIGHT) || (mainStickX > deadZone && key_stickpressed == true) /*|| (e.classic.ljs.pos.x > deadZone && key.stickpressed == true)*/);
        key_right = clamp(key_right, 0 , 1);

    // UP KEYS

    key_up = (/*(Btndown & WPAD_BUTTON_RIGHT) || (Btndown & WPAD_CLASSIC_BUTTON_UP) ||*/ (BtndownGC & PAD_BUTTON_UP) || (mainStickY > deadZone)/* || (e.classic.ljs.pos.y > deadZone)*/);
    key_up2 = (/*(pressed & WPAD_BUTTON_RIGHT) || (pressed & WPAD_CLASSIC_BUTTON_UP) ||*/ (pressedGC & PAD_BUTTON_UP) || (mainStickY > deadZone && key_stickpressed == true) /*|| (e.classic.ljs.pos.y > deadZone && key.stickpressed == true)*/);
        key_up = clamp(key_up, 0 , 1);

    // DOWN KEYS

    key_down = (/*(Btndown & WPAD_BUTTON_LEFT) || (Btndown & WPAD_CLASSIC_BUTTON_DOWN) ||*/ (BtndownGC & PAD_BUTTON_DOWN) || (mainStickY < -deadZone) /*|| (-e.classic.ljs.pos.y < -deadZone)*/);
    key_down2 = (/*(pressed & WPAD_BUTTON_LEFT) || (pressed & WPAD_CLASSIC_BUTTON_DOWN) ||*/ (pressedGC & PAD_BUTTON_DOWN) || (mainStickY < -deadZone && key_stickpressed == true) /*|| (-e.classic.ljs.pos.y < -deadZone && key.stickpressed == true)*/);
        key_down = clamp(key_down, 0 , 1);

    // JUMP KEYS

    key_jump = (/*(Btndown & WPAD_BUTTON_2) || (Btndown & WPAD_CLASSIC_BUTTON_B) ||*/ (BtndownGC & PAD_BUTTON_A));
        key_jump = clamp(key_jump, 0 , 1);

    key_jump2 = (/*(pressed & WPAD_BUTTON_2) || (pressed & WPAD_CLASSIC_BUTTON_B) ||*/ (pressedGC & PAD_BUTTON_A));
        key_jump2 = clamp(key_jump2, 0 , 1);

    if (key_jump){
		jumpKeyBufferTimer = bufferTime;
	}
	if (jumpKeyBufferTimer > 0){
		jumpKeyBuffered = 1;
		jumpKeyBufferTimer--;
	} else {
		jumpKeyBuffered = 0;
	}

    key_jump3 = (/*(released & WPAD_BUTTON_2) || (released & WPAD_CLASSIC_BUTTON_B) ||*/ (releasedGC & PAD_BUTTON_A));

    // RUN KEYS

    key_run = (/*(Btndown & WPAD_BUTTON_1) || (Btndown & WPAD_CLASSIC_BUTTON_Y) ||*/ (BtndownGC & PAD_BUTTON_B));
    key_run2 = (/*(pressed & WPAD_BUTTON_1) || (pressed & WPAD_CLASSIC_BUTTON_Y) ||*/ (pressedGC & PAD_BUTTON_B));
    key_run3 = (/*(released & WPAD_BUTTON_1) || (released & WPAD_CLASSIC_BUTTON_Y) ||*/ (releasedGC & PAD_BUTTON_B));

    //CROUCH KEYS

    key_crouch = (/*(Btndown & WPAD_BUTTON_B) || (Btndown & WPAD_CLASSIC_BUTTON_FULL_R) ||*/ (BtndownGC & PAD_TRIGGER_R));
    key_crouch2 = (/*(pressed & WPAD_BUTTON_B) || (pressed & WPAD_CLASSIC_BUTTON_FULL_R) ||*/ (pressedGC & PAD_TRIGGER_R));
    key_crouch3 = (/*(released & WPAD_BUTTON_B) || (released & WPAD_CLASSIC_BUTTON_FULL_R) ||*/ (releasedGC & PAD_TRIGGER_R));

    //START KEYS

    key_start = (/*(Btndown & WPAD_BUTTON_PLUS) || (Btndown & WPAD_CLASSIC_BUTTON_PLUS) ||*/ (BtndownGC & PAD_BUTTON_START));
    key_start2 = (/*(pressed & WPAD_BUTTON_PLUS)  || (pressed & WPAD_CLASSIC_BUTTON_PLUS) ||*/ (pressedGC & PAD_BUTTON_START));
    key_start3 = (/*(released & WPAD_BUTTON_PLUS)  || (released & WPAD_CLASSIC_BUTTON_PLUS) ||*/ (releasedGC & PAD_BUTTON_START));

    // DEBUG STAGE SELECT

    key_debug_stage_select = (/*(Btndown & WPAD_BUTTON_MINUS) || (Btndown & WPAD_CLASSIC_BUTTON_FULL_L) ||*/ (BtndownGC & PAD_TRIGGER_L));
    key_debug_stage_select2 = (/*(pressed & WPAD_BUTTON_MINUS) || (pressed & WPAD_CLASSIC_BUTTON_FULL_L) ||*/ (pressedGC & PAD_TRIGGER_L));
    key_debug_stage_select3 = (/*(released & WPAD_BUTTON_MINUS) || (released & WPAD_CLASSIC_BUTTON_FULL_L) ||*/ (releasedGC & PAD_TRIGGER_L));

    key_test = (pressedGC & PAD_BUTTON_Y);

    // EXIT

    key_exit = (/*(Btndown & WPAD_BUTTON_HOME) || (Btndown & WPAD_CLASSIC_BUTTON_HOME) ||*/ (BtndownGC & PAD_TRIGGER_Z));
    key_exit2 = (/*(pressed & WPAD_BUTTON_HOME) || (pressed & WPAD_CLASSIC_BUTTON_HOME) ||*/ (pressedGC & PAD_TRIGGER_Z));
    key_exit3 = (/*(released & WPAD_BUTTON_HOME) || (released & WPAD_CLASSIC_BUTTON_HOME) ||*/ (releasedGC & PAD_TRIGGER_Z));

    if ((mainStickX < -deadZone) || (mainStickX > deadZone) || (mainStickY > deadZone) || (mainStickY < -deadZone)/* || (e.classic.ljs.pos.x < -deadZone) || (e.classic.ljs.pos.x > deadZone) || (e.classic.ljs.pos.y > deadZone) || (-e.classic.ljs.pos.y < deadZone)*/)
    {
		  key_stickpressed = true;
    }
	  else
    {
		  key_stickpressed = false;
    }
}
