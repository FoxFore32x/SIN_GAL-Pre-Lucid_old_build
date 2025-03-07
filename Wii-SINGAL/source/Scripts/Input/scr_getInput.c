#include <grrlib.h>
#include <ogc/video.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>
#include <wiiuse/wpad.h>
#include <mp3player.h>
#include <stdio.h>
#include <asndlib.h>
#include <gctypes.h>
#include <gccore.h>

#include "../../Sprites/Sprites.h"
#include "../SystemGML/scr_gml.h"
#include "../../Rooms/room.h"
#include "../../Objects/objects.h"
#include "input.h"

const int deadZone = 40;

void scr_getInput() {

    WPAD_ScanPads();
    PAD_ScanPads(); // Update controller status

    expansion_t e;
    WPAD_Expansion(WPAD_CHAN_0, &e);

    u32 pressed = WPAD_ButtonsHeld(0);
    u32 Btndown = WPAD_ButtonsDown(0);
    u32 released = WPAD_ButtonsUp(0);

    u16 pressedGC = PAD_ButtonsHeld(0);
    u16 BtndownGC = PAD_ButtonsDown(0);
    u16 releasedGC = PAD_ButtonsUp(0);

    // Get main control stick input
    s8 mainStickX = PAD_StickX(0); // Get X-axis position (-80 to 80)
    s8 mainStickY = PAD_StickY(0); // Get Y-axis position (-80 to 80)

    // LEFT KEYS

    key.left = ((Btndown & WPAD_BUTTON_UP) || (Btndown & WPAD_CLASSIC_BUTTON_LEFT) || (BtndownGC & PAD_BUTTON_LEFT) || (mainStickX < -deadZone) || (e.classic.ljs.pos.x < -deadZone));
    key.left2 = ((pressed & WPAD_BUTTON_UP) || (pressed & WPAD_CLASSIC_BUTTON_LEFT) || (pressedGC & PAD_BUTTON_LEFT) || (mainStickX < -deadZone && key.stickpressed == true) || (e.classic.ljs.pos.x < -deadZone && key.stickpressed == true));

    // RIGHT KEYS

    key.right = ((Btndown & WPAD_BUTTON_DOWN) || (Btndown & WPAD_CLASSIC_BUTTON_RIGHT) || (BtndownGC & PAD_BUTTON_RIGHT) || (mainStickX > deadZone) || (e.classic.ljs.pos.x > deadZone));
    key.right2 = ((pressed & WPAD_BUTTON_DOWN) || (pressed & WPAD_CLASSIC_BUTTON_RIGHT) || (pressedGC & PAD_BUTTON_RIGHT) || (mainStickX > deadZone && key.stickpressed == true) || (e.classic.ljs.pos.x > deadZone && key.stickpressed == true));

    // UP KEYS

    key.up = ((Btndown & WPAD_BUTTON_RIGHT) || (Btndown & WPAD_CLASSIC_BUTTON_UP) || (BtndownGC & PAD_BUTTON_UP) || (mainStickY > deadZone) || (e.classic.ljs.pos.y > deadZone));
    key.up2 = ((pressed & WPAD_BUTTON_RIGHT) || (pressed & WPAD_CLASSIC_BUTTON_UP) || (pressedGC & PAD_BUTTON_UP) || (mainStickY > deadZone && key.stickpressed == true) || (e.classic.ljs.pos.y > deadZone && key.stickpressed == true));

    // DOWN KEYS

    key.down = ((Btndown & WPAD_BUTTON_LEFT) || (Btndown & WPAD_CLASSIC_BUTTON_DOWN) || (BtndownGC & PAD_BUTTON_DOWN) || (mainStickY < -deadZone) || (-e.classic.ljs.pos.y < -deadZone));
    key.down2 = ((pressed & WPAD_BUTTON_LEFT) || (pressed & WPAD_CLASSIC_BUTTON_DOWN) || (pressedGC & PAD_BUTTON_DOWN) || (mainStickY < -deadZone && key.stickpressed == true) || (-e.classic.ljs.pos.y < -deadZone && key.stickpressed == true));

    // JUMP KEYS

    key.jump = ((Btndown & WPAD_BUTTON_2) || (Btndown & WPAD_CLASSIC_BUTTON_B) || (BtndownGC & PAD_BUTTON_A));
    key.jump2 = ((pressed & WPAD_BUTTON_2) || (pressed & WPAD_CLASSIC_BUTTON_B) || (pressedGC & PAD_BUTTON_A));
    key.jump3 = ((released & WPAD_BUTTON_2) || (released & WPAD_CLASSIC_BUTTON_B) || (releasedGC & PAD_BUTTON_A));

    // RUN KEYS

    key.run = ((Btndown & WPAD_BUTTON_1) || (Btndown & WPAD_CLASSIC_BUTTON_Y) || (BtndownGC & PAD_BUTTON_B));
    key.run2 = ((pressed & WPAD_BUTTON_1) || (pressed & WPAD_CLASSIC_BUTTON_Y) || (pressedGC & PAD_BUTTON_B));
    key.run3 = ((released & WPAD_BUTTON_1) || (released & WPAD_CLASSIC_BUTTON_Y) || (releasedGC & PAD_BUTTON_B));

    //CROUCH KEYS

    key.crouch = ((Btndown & WPAD_BUTTON_B) || (Btndown & WPAD_CLASSIC_BUTTON_FULL_R) || (BtndownGC & PAD_TRIGGER_R));
    key.crouch2 = ((pressed & WPAD_BUTTON_B) || (pressed & WPAD_CLASSIC_BUTTON_FULL_R) || (pressedGC & PAD_TRIGGER_R));
    key.crouch3 = ((released & WPAD_BUTTON_B) || (released & WPAD_CLASSIC_BUTTON_FULL_R) || (releasedGC & PAD_TRIGGER_R));

    //START KEYS

    key.start = ((Btndown & WPAD_BUTTON_PLUS) || (Btndown & WPAD_CLASSIC_BUTTON_PLUS) || (BtndownGC & PAD_BUTTON_START));
    key.start2 = ((pressed & WPAD_BUTTON_PLUS)  || (pressed & WPAD_CLASSIC_BUTTON_PLUS) || (pressedGC & PAD_BUTTON_START));
    key.start3 = ((released & WPAD_BUTTON_PLUS)  || (released & WPAD_CLASSIC_BUTTON_PLUS) || (releasedGC & PAD_BUTTON_START));

    // DEBUG STAGE SELECT

    key.debug_stage_select = ((Btndown & WPAD_BUTTON_MINUS) || (Btndown & WPAD_CLASSIC_BUTTON_FULL_L) || (BtndownGC & PAD_TRIGGER_L));
    key.debug_stage_select2 = ((pressed & WPAD_BUTTON_MINUS) || (pressed & WPAD_CLASSIC_BUTTON_FULL_L) || (pressedGC & PAD_TRIGGER_L));
    key.debug_stage_select3 = ((released & WPAD_BUTTON_MINUS) || (released & WPAD_CLASSIC_BUTTON_FULL_L) || (releasedGC & PAD_TRIGGER_L));

    // EXIT

    key.exit = ((Btndown & WPAD_BUTTON_HOME) || (Btndown & WPAD_CLASSIC_BUTTON_HOME) || (BtndownGC & PAD_TRIGGER_Z));
    key.exit2 = ((pressed & WPAD_BUTTON_HOME) || (pressed & WPAD_CLASSIC_BUTTON_HOME) || (pressedGC & PAD_TRIGGER_Z));
    key.exit3 = ((released & WPAD_BUTTON_HOME) || (released & WPAD_CLASSIC_BUTTON_HOME) || (releasedGC & PAD_TRIGGER_Z));

    if ((mainStickX < -deadZone) || (mainStickX > deadZone) || (mainStickY > deadZone) || (mainStickY < -deadZone) || (e.classic.ljs.pos.x < -deadZone) || (e.classic.ljs.pos.x > deadZone) || (e.classic.ljs.pos.y > deadZone) || (-e.classic.ljs.pos.y < deadZone))
		key.stickpressed = true;
	  else
		key.stickpressed = false;
}
