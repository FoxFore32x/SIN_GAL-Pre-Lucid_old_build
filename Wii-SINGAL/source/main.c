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
#include "Extensions/oggplayer.h"

#include "Sprites/Sprites.h"
#include "Objects/objects.h"
#include "Scripts/SystemGML/scr_gml.h"
#include "Rooms/room.h"
#include "fot_ttf.h"
#include "Scripts/Input/input.h"
#include "Scripts/Video/scr_video.h"

int main(int argc, char **argv) {
    // Initialization code for GRRLIB, WPAD, etc.
    GRRLIB_Init();
    WPAD_Init();
    PAD_Init();
    ASND_Init();
    MP3Player_Init();
    //fatInitDefault();
    InitVideo();

    GRRLIB_ttfFont *myFont = GRRLIB_LoadTTF(fot_ttf, fot_ttf_size);

    GRRLIB_Settings.antialias = false;

    GRRLIB_2dMode();

    // Game loop
    while (1) {
        scr_getInput();

        room_background(TITLEBGTEST);

        obj_camera(scrnWidth, 480, &obj_player2);
        
        //GRRLIB_PrintfTTF(100, 100, myFont, "Haha peepeea poopoo", 24, GRRLIB_WHITE); // X=100, Y=100, Size=24, White color
        //GRRLIB_PrintfTTF(100, 200, myFont, "SINGAL's Archive", 50, GRRLIB_WHITE); // X=100, Y=100, Size=24, White color
        GRRLIB_PrintfTTF(40, -20, myFont, "I", 270, GRRLIB_BLACK); // X=100, Y=100, Size=24, White color
        GRRLIB_PrintfTTF(150, 120, myFont, "NCONSISTENT", 58, GRRLIB_BLACK); // X=100, Y=100, Size=24, White color
        GRRLIB_PrintfTTF(150, 194, myFont, "LLUSIONS", 58, GRRLIB_BLACK); // X=100, Y=100, Size=24, White color
        GRRLIB_PrintfTTF(400, 444, myFont, "Feltree Forestk Soft.", 16, GRRLIB_RED); // X=100, Y=100, Size=24, White color

        if (key.start) {

            room_goto(room_debug_select);
        }

        if ((key.exit2)) {
            exit(0); // Exit from the game loop
        }

        GRRLIB_Render();
    }

    GRRLIB_FreeTTF(myFont);

    VIDEO_WaitVSync();

    // Cleanup code and return
    return 0;
}

//In this code is some sort of recreation of the Game Maker room handiling system, which i have yet to complete.