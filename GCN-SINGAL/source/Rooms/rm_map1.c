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
    oPointer,
    oSpot,
    NUM_OBJS // This will keep track of the total number of rooms
};

void rm_map1()
{
    while (RoomChanged == 0)
    {

        ObjectList* RmObjLst[20] = {
            &obj_pointer,
            &obj_spot
        };

        for(int i = 0; i < 20; i++){
            if (RmObjLst[i] != NULL) {
                obj_init(RmObjLst[i]);
            }
        }

        instance_create(RmObjLst[oPointer], 128, 160, 2, 2, &sprite_teoriIcontest, LAYER_PLAYER, false, NULL);

        instance_create(RmObjLst[oSpot], 416, 224, 1, 1, &sprite_ball2 ,LAYER_SOLID, false, NULL);

        instance_create(RmObjLst[oSpot], 128, 224, 1, 1, &sprite_ball2, LAYER_SOLID, false, NULL);

        audio_play_sound("BGM_CONCEPT_UPANISHADS", true);

        oCamera_RoomStart(640, 480, 1366, 528, RmObjLst[oPointer]);

        GRRLIB_FillScreen(GRRLIB_BLACK); // Clear the screen

        while (1)
        {
            scr_getInput();

            room_background(craziidab);

            obj_pointer_draw();

            obj_spot_draw();

            obj_camera(640, 480, RmObjLst[oPointer], 0, 1366, 528);

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
        obj_cleanup(&obj_spot);
        obj_cleanup(&obj_pointer);
        /*obj_solid_cleanup();
        obj_BGWall_cleanup();*/
        GRRLIB_Exit(); // Be a good boy, clear the memory allocated by GRRLIB
    }
}