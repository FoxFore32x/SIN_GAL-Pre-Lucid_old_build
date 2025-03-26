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
#include <unistd.h>

#include "../Sprites/Sprites.h"
#include "../Scripts/Scripts.h"
#include "room.h"
#include "../Objects/objects.h"
#include "../Extensions/Extensions.h"

void rm_title()
{
    while (RoomChanged == 0)
    {
    
        oCamera_RoomStart(640, 480, 4000, 1024, NULL);

        GRRLIB_FillScreen(GRRLIB_BLACK); // Clear the screen

        audio_play_sound("BGM_CONCEPT_LIES_AND_TRUHT", true);

        while (1)
        {
            GRRLIB_ttfFont *myFont = GRRLIB_LoadTTF(fot_ttf, fot_ttf_size);
            scr_getInput();

            obj_camera(640, 480, NULL, 0, 640, 528);

            room_background(TITLEBGTEST);
            
            //GRRLIB_PrintfTTF(100, 100, myFont, "Haha peepeea poopoo", 24, GRRLIB_WHITE); // X=100, Y=100, Size=24, White color
            //GRRLIB_PrintfTTF(100, 200, myFont, "SINGAL's Archive", 50, GRRLIB_WHITE); // X=100, Y=100, Size=24, White color
            GRRLIB_PrintfTTF(40, -20, myFont, "I", 270, GRRLIB_BLACK); // X=100, Y=100, Size=24, White color
            GRRLIB_PrintfTTF(150, 120, myFont, "NCONSISTENT", 58, GRRLIB_BLACK); // X=100, Y=100, Size=24, White color
            GRRLIB_PrintfTTF(150, 194, myFont, "LLUSIONS", 58, GRRLIB_BLACK); // X=100, Y=100, Size=24, White color
            GRRLIB_PrintfTTF(400, 444, myFont, "Feltree Forestk Soft.", 16, GRRLIB_RED); // X=100, Y=100, Size=24, White color

            if (key_start) {
                room_goto(room_map1);
            }

            if(key_debug_stage_select2)
            {
                room_goto(room_debug_select);
            }

            if ((key_exit2)) {
                exit(0); // Exit from the game loop
            }

            GRRLIB_Render();
            GRRLIB_FreeTTF(myFont);
        }

        GRRLIB_Exit(); // Be a good boy, clear the memory allocated by GRRLIB
    }
}