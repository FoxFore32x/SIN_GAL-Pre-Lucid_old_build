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

#include "../Sprites/Sprites.h"
#include "../Scripts/Scripts.h"
#include "room.h"
#include "../Objects/objects.h"
#include "../Extensions/Extensions.h"

int pos = 1;

//GRRLIB_texImg* tex_menu;

// Define the array of room names
const char* roomNames[] = {
    "room_debug_select",
    "room_title",
    "room_test",
    "room_testanim",
    "room_testFMV",
    "room_test2",
    "room_train1",
    "room_map1",
    "room_train2"
    // Add more room names here
};

void rm_debug_select() {
    while (RoomChanged == 0)
    {

    GRRLIB_ttfFont *myFont = GRRLIB_LoadTTF(fot_ttf, fot_ttf_size); // Debug Font

    audio_play_sound("BGM_CONCEPT_JIBBOOM", true);

    //tex_menu = GRRLIB_LoadTexturePNG(menu);

    while (1) {

        GRRLIB_FillScreen(GRRLIB_BLACK);

        //GRRLIB_DrawImg(0, 0, tex_menu, 0, 1, 1, GRRLIB_WHITE);

        obj_camera(640, 528, NULL, 0, 4000, 1024);

        room_background(menu);

        scr_getInput();

        if (key_up && pos > -1) {
            pos -= 1;
        } else if (key_down && pos < (NUM_ROOMS)) {
            pos += 1;
        }

        if (key_up && pos < 0)
        {
            pos = NUM_ROOMS - 1;
        } else if (key_down && pos == NUM_ROOMS)
        {
            pos = 0;
        }
        

        for (int i = 0; i < NUM_ROOMS; i++) {
            if (pos == i) {
                GRRLIB_PrintfTTF(56, 38 + i * 22, myFont, roomNames[i], 24, GRRLIB_GREEN);
            } else {
                GRRLIB_PrintfTTF(56, 38 + i * 22, myFont, roomNames[i], 24, GRRLIB_RED);
            }
        }

        if (key_jump && pos >= 0 && pos < NUM_ROOMS) {
            // Assuming you have a function to go to a room by name
            room_goto(pos);
        }

        if ((key_exit2)) {
            exit(0); // Exit from the game loop
        }

        GRRLIB_Render();
    }
    RmClean();
    GRRLIB_FreeTTF(myFont); // Free the loaded TTF font when done
    // Clean up and exit
    GRRLIB_Exit();
    }
}
