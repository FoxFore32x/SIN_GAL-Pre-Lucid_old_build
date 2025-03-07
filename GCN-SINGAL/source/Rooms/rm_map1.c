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

void rm_map1()
{
    while (RoomChanged == 0)
    {

    /*obj_init(&obj_spot);
    obj_init(&obj_pointer);

    obj_add(&obj_spot, 128, 224, 32, 32, &sprite_ball2, LAYER_SOLID);

    obj_add(&obj_spot, 416, 224, 32, 32, &sprite_ball2 ,LAYER_SOLID);

    obj_add(&obj_pointer, 128, 160, 64, 64, &sprite_teoriIcontest, LAYER_PLAYER);*/

    instance_create(&obj_pointer, 128, 160, 64, 64, &sprite_teoriIcontest, LAYER_PLAYER, false, NULL);

    instance_create(&obj_spot, 416, 224, 32, 32, &sprite_ball2 ,LAYER_SOLID, false, NULL);

    instance_create(&obj_spot, 128, 224, 32, 32, &sprite_ball2, LAYER_SOLID, false, NULL);

    audio_play_sound("BGM_CONCEPT_UPANISHADS", true);

    oCamera_RoomStart(scrnWidth, 480, 1366, 528, &obj_pointer);

    GRRLIB_FillScreen(GRRLIB_BLACK); // Clear the screen

    while (1)
    {
        scr_getInput();

        room_background(craziidab);

        obj_pointer_draw();

        obj_spot_draw();

        obj_camera(scrnWidth, 480, &obj_pointer, 0, 1366, 528);

        if (key_run)
        {
            room_goto(room_train1);
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
    /*obj_cleanup(&obj_spot);
    obj_cleanup(&obj_pointer);*/
    /*obj_solid_cleanup();
    obj_BGWall_cleanup();*/
    GRRLIB_Exit(); // Be a good boy, clear the memory allocated by GRRLIB
    }
}