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

void rm_train1()
{
    while (RoomChanged == 1)
    {

    obj_init(&obj_solid_list);
    obj_init(&obj_BGWall_list);
    obj_init(&obj_player2);

    obj_add(&obj_solid_list, 0, 0, 1*32, 28*32);

    obj_add(&obj_solid_list, 32, 448, 14*32, 5*32);

    obj_add(&obj_solid_list, 0, 896, 10*32, 4*32);

    obj_add(&obj_solid_list, 320, 832, 13*32, 6*32);

    obj_add(&obj_solid_list, 736, 448, 13*32, 18*32);

    obj_add(&obj_solid_list, 864, 0, 9*32, 11*32);

    obj_add(&obj_solid_list, 1344, 0, 5*32, 24*32);

    obj_add(&obj_solid_list, 1280, 960, 15*32, 2*32);

    obj_add(&obj_solid_list, 1760, 608, 12*32, 13*32);

    obj_add(&obj_solid_list, 2496, 320, 8*32, 22*32);

    obj_add(&obj_solid_list, 3328, 384, 11*32, 1*32);

    obj_add(&obj_solid_list, 3680, 384, 27*32, 20*32);

    /*obj_add(&obj_solid_list, x, x, *32, *32);

    obj_add(&obj_solid_list, x, x, *32, *32);

    obj_add(&obj_solid_list, x, x, *32, *32);

    obj_add(&obj_solid_list, x, x, *32, *32);

    obj_add(&obj_solid_list, x, x, *32, *32);

    obj_add(&obj_solid_list, x, x, *32, *32);*/

    obj_add(&obj_BGWall_list, 2048, 320, 15*32, 22*32);

    obj_add(&obj_player2, 96, 800, 1, 1);

    GRRLIB_FillScreen(GRRLIB_BLACK); // Clear the screen

    while (1)
    {
        scr_getInput();
        
        obj_music("BGM_CONCEPT_LIGHTS_ARE_ON", true);

        room_background(bg_temp);

        obj_camera(scrnWidth, 480, &obj_player2);

        obj_BGWall_draw(true);

        obj_player2_Step();

        obj_solid_draw(true);


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

    GRRLIB_Exit(); // Be a good boy, clear the memory allocated by GRRLIB
    }
}