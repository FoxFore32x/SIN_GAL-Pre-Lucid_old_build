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

void TEST2()
{
    while (RoomChanged == 0)
    {

    obj_init(&obj_solid);
    obj_init(&obj_BGWall);
    obj_init(&obj_player2);

    obj_add(&obj_solid, 0, 1020, 4000, 32, &spr_solid,LAYER_SOLID, NULL);

    obj_add(&obj_solid, 0, 340, 400, 32, &spr_solid, LAYER_SOLID, NULL);
    obj_add(&obj_solid, 0, 988, 250, 32, &spr_solid, LAYER_SOLID, NULL);
    obj_add(&obj_solid, 486, 884, 53, 32, &spr_solid, LAYER_SOLID, NULL);
    obj_add(&obj_solid, 120, 772, 57, 32, &spr_solid, LAYER_SOLID, NULL);
    obj_add(&obj_solid, 532, 648, 69, 32, &spr_solid, LAYER_SOLID, NULL);
    obj_add(&obj_solid, 120, 500, 57, 32, &spr_solid, LAYER_SOLID, NULL);
    obj_add(&obj_solid, 700, 500, 32, 720, &spr_solid, LAYER_SOLID, NULL);
    obj_add(&obj_solid, 890, 340, 400, 32, &spr_solid, LAYER_SOLID, NULL);

    obj_add(&obj_BGWall, 1216, 256, 21, 24, &spr_BGwall,LAYER_BG_WALL, NULL);

    obj_add(&obj_player2, 10, 10, 1, 1, &spr_teoriIdle, LAYER_PLAYER, NULL);

    audio_play_sound("BGM_CONCEPT_COME_BY_THE_HILLS", true);

    oCamera_RoomStart(scrnWidth, 480, 4000, 1024, &obj_player2);

    GRRLIB_FillScreen(GRRLIB_BLACK); // Clear the screen

    while (1)
    {
        scr_getInput();

        room_background(bg_temp);

        obj_camera(scrnWidth, 480, &obj_player2, 0, 4000, 1024);

        obj_player_Step();

        obj_solid_draw(true);

        obj_BGWall_draw(true);


        if (key_debug_stage_select2) {
            room_goto(room_debug_select);
        }

        if ((key_exit2)) {
            exit(0); // Exit from the game loop
        }

        GRRLIB_Render();
    }
    // Clean up objects
    obj_cleanup(&obj_solid);
    obj_cleanup(&obj_BGWall);
    obj_cleanup(&obj_player2);

    GRRLIB_Exit(); // Be a good boy, clear the memory allocated by GRRLIB
    }
}