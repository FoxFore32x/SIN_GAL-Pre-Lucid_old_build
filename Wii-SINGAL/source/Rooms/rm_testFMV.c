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
#include <SDL/SDL.h>
#include <mpeg/smpeg.h>

#include "../Sprites/Sprites.h"
#include "../Scripts/SystemGML/scr_gml.h"
#include "room.h"
/*#include "../Scripts/SystemGML/all_music.h"*/
#include "fot_ttf.h"
#include "../Objects/objects.h"
#include "../Scripts/Input/input.h"

// Define video dimensions
#define VIDEO_WIDTH  640
#define VIDEO_HEIGHT 480

#define VIDEO_FRAME_MAX_SIZE 1000000

void rm_testFMV() {
    while (RoomChanged == 1)
    {

        GRRLIB_ttfFont *myFont = GRRLIB_LoadTTF(fot_ttf, fot_ttf_size);
    
        // Game loop
        while (1) {
            scr_getInput();
            
            // Clear the screen
            GRRLIB_FillScreen(0xFF000000);

            

            // Render the decoded video frame onto the screen
            if (key.debug_stage_select2) {
                room_goto(room_debug_select);
            }

            if ((key.exit2)) {
                exit(0); // Exit from the game loop
            }

            GRRLIB_Render();
            
        }
        GRRLIB_FreeTTF(myFont); // Free the loaded TTF font when done
        GRRLIB_Exit();
    }
}

//In this code is some sort of recreation of the Game Maker room handiling system, which i have yet to complete.