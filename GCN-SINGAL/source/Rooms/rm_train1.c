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

enum ObjectNames {
    oPlayer,
    oSolid,
    oSlope,          // Assign unique values to each room
    oBGWall,
    oWarp,
    oWarpController,
    NUM_OBJS // This will keep track of the total number of rooms
};

ObjectList* RmObjLst[1000] = {
    &obj_player2,
    &obj_solid,
    &obj_slope,
    &obj_BGWall,
    &obj_Warp,
    &obj_WarpController
}; // Now it's an array

void rm_train1()
{
    while (RoomChanged == 0)
    {

        instance_create(RmObjLst[oSolid], 0, 0, 1, 28, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 32, 448, 14, 5, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 0, 896, 10, 4, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 320, 832, 13, 6, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 736, 448, 13, 18, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 864, 0, 9, 11, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 1344, 0, 5, 24, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 1280, 960, 15, 2, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 1760, 608, 12, 13, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 2496, 320, 8, 22, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 3328, 384, 11, 1, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 3680, 384, 27, 20, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 1600, 800, 5, 5, &sprite_slope, LAYER_SOLID, false, &obj_solid);

        instance_create(RmObjLst[oSolid], 100, 300, 8, 5, &sprite_slope, LAYER_SOLID, false, &obj_solid);

        //obj_add(&obj_solid_list, x, x, *32, *32);

        instance_create(RmObjLst[oBGWall], 2048, 320, 15, 22, &spr_BGwall, LAYER_BG_WALL, false, NULL);

        instance_create(RmObjLst[oWarp], 4096, 0, 3, 12, &spr_Warp, LAYER_PLAYER, false, NULL);

        if (instance_exists(RmObjLst[oPlayer]) == false)
        {
            instance_create(RmObjLst[oPlayer], 200, 800, 1, 1, &spr_teoriIdle, LAYER_PLAYER, false, NULL);
        }

        oCamera_RoomStart(640, 528, 6144, 2048, RmObjLst[oPlayer]);

        audio_play_sound(bgm_concept_lights_are_on, true);

        InitializeScreenCapture();

        GRRLIB_FillScreen(GRRLIB_BLACK); // Clear the screen

        while (1)
        {
            //scr_getInput();

            obj_camera(640, 528, RmObjLst[oPlayer], 0, 6144, 2048);

            room_background(bg_temp);

            //obj_Warp_Step(32, 319, room_train2);

            obj_Warp_Step(32, 200, room_train2);

            obj_BGWall_draw(true);

            obj_solid_draw(false);
            
            obj_slope_draw(true);

            if (instance_exists(&obj_player2))
            {
                obj_player_Step();
                obj_player_Draw();
            }

            if (key_debug_stage_select2) {
                room_goto(room_debug_select);
            }

            if ((key_exit2)) {
                exit(0); // Exit from the game loop
            }

            CaptureScreenToTexture();

            DrawCapturedScreen();

            GRRLIB_Render();
        }
        RmClean();
        // Clean up objects
        obj_cleanup(&obj_solid);
        obj_cleanup(&obj_BGWall);
        obj_cleanup(&obj_player2);
        obj_cleanup(&obj_slope);
        obj_cleanup(&obj_Warp);

        GRRLIB_Exit(); // Be a good boy, clear the memory allocated by GRRLIB
    }
}