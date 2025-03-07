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

void rm_train2()
{
    while (RoomChanged == 0)
    {

        instance_create(&obj_solid, -256, 384, 14, 20, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(&obj_solid, 192, 864, 15, 5, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(&obj_solid, 672, 960, 22, 2, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(&obj_solid, 1312, 416, 2, 17, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(&obj_solid, 928, 0, 6, 16, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(&obj_solid, 3264, 288, 4, 1, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(&obj_solid, 2816, 0, 37, 1, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(&obj_solid, 3968, 32, 1, 37, &spr_solid, LAYER_SOLID, false, NULL);

        instance_create(&obj_solid, 3392, 288, 6, 29, &spr_solid, LAYER_SOLID, false, NULL);

        //obj_add(&obj_solid_list, x, x, *32, *32);

        instance_create(&obj_BGWall, 1632, 384, 15, 25, &spr_BGwall, LAYER_BG_WALL, false, NULL);

        instance_create(&obj_BGWall, 2400, 384, 14, 25, &spr_BGwall, LAYER_BG_WALL, false, NULL);

        instance_create(&obj_Warp, 3584, 1120, 12, 2, &spr_Warp, LAYER_PLAYER, false, NULL);

        //obj_add(&obj_player2, 96, 800, 1, 1, &spr_teoriIdle, LAYER_PLAYER);

        //audio_play_sound(bgm_concept_lights_are_on, true);

        oCamera_RoomStart(640, 528, 4000, 1024, &obj_player2);

        GRRLIB_FillScreen(GRRLIB_BLACK); // Clear the screen

        while (1)
        {
            //scr_getInput();

            room_background(bg_temp);
            
            obj_camera(640, 528, &obj_player2, 0, 4000, 1024);

            obj_Warp_Step(3968, 319, room_train1);

            obj_BGWall_draw(true);

            obj_solid_draw(true);

            //obj_slope_draw(true);
            
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

            GRRLIB_Render();
        }
        RmClean();
        // Clean up objects
        obj_cleanup(&obj_solid);
        obj_cleanup(&obj_BGWall);
        obj_cleanup(&obj_player2);
        obj_cleanup(&obj_Warp);

        GRRLIB_Exit(); // Be a good boy, clear the memory allocated by GRRLIB
    }
}