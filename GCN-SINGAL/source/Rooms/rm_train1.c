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

void rm_train1()
{
    while (RoomChanged == 0)
    {
        ObjectList* RmObjLst[20] = {
            &obj_player2,
            &obj_solid,
            &obj_slope,
            &obj_BGWall,
            &obj_Warp,
        }; // Now it's an array

        for(int i = 0; i < 20; i++){
            if (RmObjLst[i] != NULL) {
                obj_init(RmObjLst[i]);
            }
        }

        instance_create(RmObjLst[oSolid], 0, 0, 1, 28, 0, spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 32, 448, 14, 5, 0, spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 0, 896, 10, 4, 0, spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 320, 832, 13, 6, 0, spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 736, 448, 13, 18, 0, spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 864, 0, 9, 11, 0, spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 1344, 0, 5, 24, 0, spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 1280, 960, 15, 2, 0, spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 1760, 608, 12, 13, 0, spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 2496, 320, 8, 22, 0, spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 3328, 384, 11, 1, 0, spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSolid], 3680, 384, 27, 20, 0, spr_solid, LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSlope], 1600, 800, 5, 5, 0, sprite_slope, LAYER_SOLID, false, &obj_solid);

        instance_create(RmObjLst[oSlope], 100, 300, 8, 5, 0, sprite_slope, LAYER_SOLID, false, &obj_solid);

        //obj_add(&obj_solid_list, x, x, *32, *32);

        instance_create(RmObjLst[oBGWall], 2048, 320, 15, 22, 0, spr_BGwall, LAYER_BG_WALL, false, NULL);

        instance_create(RmObjLst[oWarp], 4096, 0, 3, 12, 0, spr_Warp, LAYER_PLAYER, false, NULL);

        instance_create(RmObjLst[oPlayer], 200, 800, 1, 1, 0, RmObjLst[oPlayer]->sprite_index, LAYER_PLAYER, true, NULL);

        oCamera_RoomStart(640, 480, 6144, 2048, RmObjLst[oPlayer]);

        audio_play_sound(bgm_concept_lights_are_on, true);

        InitializeScreenCapture();

        GRRLIB_FillScreen(GRRLIB_BLACK); // Clear the screen

        while (1)
        {
            //scr_getInput();

            /*obj_pointer_draw();

            obj_spot_draw();*/

            obj_camera(640, 480, RmObjLst[oPlayer], 0, 6144, 2048);

            room_background(bg_temp);

            //obj_Warp_Step(32, 319, room_train2);

            obj_Warp_Step(576, 224, room_train2);

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
        obj_cleanup(&obj_solid);
        obj_cleanup(&obj_BGWall);
        obj_cleanup(&obj_player2);
        obj_cleanup(&obj_Warp);

        GRRLIB_Exit(); // Be a good boy, clear the memory allocated by GRRLIB
    }
}