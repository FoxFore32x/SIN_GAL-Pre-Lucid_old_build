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

void rm_map1()
{
    while (RoomChanged == 1)
    {

    obj_init(&obj_spot);
    obj_init(&obj_pointer);

    obj_add(&obj_spot, 128, 224, 32, 32);

    obj_add(&obj_spot, 416, 224, 32, 32);

    obj_add(&obj_pointer, 128, 160, 64, 64);

    GRRLIB_FillScreen(GRRLIB_BLACK); // Clear the screen

    while (1)
    {
        scr_getInput();
        
        obj_music("BGM_CONCEPT_UPANISHADS", true);

        room_background(craziidab);

        obj_pointer_draw();

        obj_spot_draw();

        obj_camera(scrnWidth, 480, &obj_pointer);

        if (key.debug_stage_select2) {
            room_goto(room_debug_select);
        }

        if ((key.exit2)) {
            exit(0); // Exit from the game loop
        }

        GRRLIB_Render();
    }
    // Clean up objects
    obj_cleanup(&obj_spot);
    obj_cleanup(&obj_pointer);
    /*obj_solid_cleanup();
    obj_BGWall_cleanup();*/
    GRRLIB_Exit(); // Be a good boy, clear the memory allocated by GRRLIB
    }
}