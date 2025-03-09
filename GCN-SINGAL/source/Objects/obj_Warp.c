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
#include "../Rooms/room.h"
#include "objects.h"
#include "../Extensions/Extensions.h"

ObjectList obj_Warp;
Warper warp;

void obj_Warp_Step(int xPosition, int yPosition, int roomName){

    currentObject = NULL;

    for (int i = 0; i < obj_Warp.numObjects; ++i) {
        currentObject = obj_Warp.objects[i];
        if (currentObject != NULL) {
            //code goes here

            float Wx = currentObject->x;
            float Wy = currentObject->y;

            // Check collision with obj_player
            if (place_meeting(Wx, Wy, &obj_player2)) {
                // Create the warp instance
                warp.base = instance_create(&obj_WarpController, 0, 0, 1, 1, &sprite_ball2, LAYER_BACKGROUND, false, NULL);
                // Set additional properties like newX, newY, and newRoom
                warp.newX = xPosition;
                warp.newY = yPosition;
                warp.newRoom = roomName;

                if(instance_exists(&obj_WarpController))
                {
                    obj_WarpController_Step();
                    obj_WarpController_Draw();
                }
            }
        }

        draw_objects(&obj_Warp, &spr_Warp, 1, 1);
    }
}