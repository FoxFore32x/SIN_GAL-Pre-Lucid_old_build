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

#include "../Sprites/Sprites.h"
#include "../Scripts/SystemGML/scr_gml.h"
#include "room.h"
/*#include "../Scripts/SystemGML/all_music.h"*/
#include "fot_ttf.h"
#include "../Objects/objects.h"
#include "../Scripts/Input/input.h"

int pos = 1;

// Define the array of room names
const char* roomNames[] = {
    "room_debug_select",
    "room_test",
    "room_testanim",
    "room_testFMV",
    "room_test2",
    "room_train1",
    "room_map1"
    // Add more room names here
};

void rm_debug_select() {
    while (RoomChanged == 1)
    {

    GRRLIB_ttfFont *myFont = GRRLIB_LoadTTF(fot_ttf, fot_ttf_size); // Debug Font

    while (1) {

        GRRLIB_FillScreen(GRRLIB_BLACK);

        scr_getInput();

        obj_music("BGM_CONCEPT_LIES_AND_TRUHT", true);

        if (key.up) {
            pos = pos - 1;
        } else if (key.down) {
            pos = pos + 1;
        }

        for (int i = 0; i < NUM_ROOMS; i++) {
            if (pos == i) {
                GRRLIB_PrintfTTF(56, 38 + i * 22, myFont, roomNames[i], 24, GRRLIB_PURPLE);
            } else {
                GRRLIB_PrintfTTF(56, 38 + i * 22, myFont, roomNames[i], 24, GRRLIB_WHITE);
            }
        }

        if (key.jump && pos >= 0 && pos < NUM_ROOMS) {
            // Assuming you have a function to go to a room by name
            room_goto(pos);
        }

        if ((key.exit2)) {
            exit(0); // Exit from the game loop
        }

        GRRLIB_Render();
    }
    GRRLIB_FreeTTF(myFont); // Free the loaded TTF font when done
    // Clean up and exit
    GRRLIB_Exit();
    }
}
