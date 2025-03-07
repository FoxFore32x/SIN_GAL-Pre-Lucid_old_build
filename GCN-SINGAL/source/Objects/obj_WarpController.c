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

ObjectList obj_WarpController;

float fadeLevel = 0.1f;

void obj_WarpController_Step(){

    for (int i = 0; i < obj_WarpController.numObjects; ++i) {
        GameObject* currentObject = obj_WarpController.objects[i];
        if (currentObject != NULL) {

            if (currentRoom != warp.newRoom)
            {
                fadeLevel += 0.050;
                if (fadeLevel >= 1)
                {
                    x = warp.newX;
                    y = warp.newY;
                    room_goto(warp.newRoom);
                }
            }
            else
            {
                fadeLevel -= 0.050;
            }
            if (fadeLevel <= 0)
            {
                instance_destroy(&obj_WarpController/*, currentObject*/);
                fadeLevel = 0;
            }
        }
    }
}

void obj_WarpController_Draw()
{
    draw_set_color(GRRLIB_BLACK);            // Set the color to black
    draw_set_alpha(fadeLevel);               // Set the alpha transparency level
    draw_rectangle(0, 0, ROOM_WIDTH, ROOM_HEIGHT, true); // Draw a filled rectangle covering the room
    draw_set_alpha(1.0f);   
}