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
#include "../Scripts/Video/scr_video.h"
/*#include "../Scripts/SystemGML/all_music.h"*/
#include "fot_ttf.h"
#include "../Objects/objects.h"
#include "../Scripts/Input/input.h"

int RoomChanged = 0;

void TEST0()
{
    while (RoomChanged == 1)
    {

    obj_init(&obj_solid_list);
    obj_init(&obj_BGWall_list);
    obj_init(&obj_player2);

    obj_player_Create(0, 850);

    obj_add(&obj_solid_list, 0, 340, 400, 32);
    obj_add(&obj_solid_list, 0, 988, 250, 32);
    obj_add(&obj_solid_list, 486, 884, 53, 32);
    obj_add(&obj_solid_list, 120, 772, 57, 32);
    obj_add(&obj_solid_list, 532, 648, 69, 32);
    obj_add(&obj_solid_list, 120, 500, 57, 32);
    obj_add(&obj_solid_list, 700, 500, 32, 720);
    obj_add(&obj_solid_list, 890, 340, 400, 32);

    obj_add(&obj_BGWall_list, 1216, 256, 21, 24);

    obj_add(&obj_player2, 10, 10, 1, 1);

    GRRLIB_FillScreen(GRRLIB_BLACK); // Clear the screen

    while (1)
    {
        scr_getInput();
        
        obj_music("BGM_CONCEPT_COME_BY_THE_HILLS", true);

        room_background(bg_test);

        obj_camera(scrnWidth, 480, &obj_player2);

        obj_player2_Step();

        obj_solid_draw(true);

        obj_BGWall_draw(true);

        if (key.debug_stage_select2) {
            room_goto(room_debug_select);
        }

        if ((key.exit2)) {
            exit(0); // Exit from the game loop
        }

        GRRLIB_Render();
    }
    // Clean up objects
    obj_cleanup(&obj_solid_list);
    obj_cleanup(&obj_BGWall_list);
    obj_cleanup(&obj_player2);
    /*obj_solid_cleanup();
    obj_BGWall_cleanup();*/
    GRRLIB_Exit(); // Be a good boy, clear the memory allocated by GRRLIB
    }
}