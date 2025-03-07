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
#include <fat.h>
#include <sdcard/gcsd.h>

#include "../Sprites/Sprites.h"
#include "../Scripts/Scripts.h"
#include "room.h"
#include "../Objects/objects.h"
#include "../Extensions/Extensions.h"

void rm_testanim() {
    while (RoomChanged == 0)
    {

        int tmr_txt = 0;
        float frame = 0;

        GRRLIB_ttfFont *myFont = GRRLIB_LoadTTF(fot_ttf, fot_ttf_size); // Debug Font

        GRRLIB_texImg *spr_player = GRRLIB_LoadTextureFromFile("cardb:/apps/SINGAL/data/Sprites/Player/TeoriIdle.png");

        GRRLIB_InitTileSet(spr_player, 150, 256, 0);

        audio_play_sound("BGM_PIZZA_TIME", true);

        // Game loop
        while (1) {
            scr_getInput();

            GRRLIB_PrintfTTF(0, 0, myFont, "Guess what this is room for...", 12, GRRLIB_WHITE); // X=100, Y=100, Size=24, White color

            tmr_txt++;

            GRRLIB_DrawTile(120, 120, spr_player, 0, 1, 1, GRRLIB_WHITE, frame);

            // Increment the frame counter
            frame = frame + 0.2;

            // Wrap the frame counter to loop through the animation
            if (frame >= 6) {
                frame = 0;
            }

            if (tmr_txt >= 100)
            {
                GRRLIB_PrintfTTF(0, 15, myFont, "Did you say ANIMATION Test Room!!?", 12, GRRLIB_WHITE); // X=100, Y=100, Size=24, White color
            }
            
            if (tmr_txt >= 200)
            {
                GRRLIB_PrintfTTF(0, 30, myFont, "WOOOOOOOOW, HOW BRILLIANT OF YOU!!", 12, GRRLIB_WHITE); // X=100, Y=100, Size=24, White color
            }

            if (tmr_txt >= 300)
            {
                GRRLIB_PrintfTTF(0, 45, myFont, "You deserve an award!!", 12, GRRLIB_WHITE); // X=100, Y=100, Size=24, White color
            }

            if (tmr_txt >= 400)
            {
                GRRLIB_PrintfTTF(0, 60, myFont, "Seriously tho, don't ask why the Pizza Tower music in the Background XDDDDD", 12, GRRLIB_WHITE); // X=100, Y=100, Size=24, White color
            }

            if (key_debug_stage_select2) {
                tmr_txt = 0;
                room_goto(room_debug_select);
            }

            if ((key_exit2)) {
                exit(0); // Exit from the game loop
            }

            GRRLIB_Render();
            
        }
        GRRLIB_FreeTexture(spr_player);
        GRRLIB_FreeTTF(myFont); // Free the loaded TTF font when done

        // Cleanup code and return
        GRRLIB_Exit();
    }
}

//In this code is some sort of recreation of the Game Maker room handiling system, which i have yet to complete.