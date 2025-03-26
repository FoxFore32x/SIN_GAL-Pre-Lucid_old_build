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

ObjectList obj_BGWall;

void obj_BGWall_draw(bool showCollisions) {

    for (int i = 0; i < obj_BGWall.numObjects; ++i) {
        GameObject* currentObject = obj_BGWall.objects[i];
        if (currentObject != NULL) {
            currentObject->collision_mask = spr_BGwall;
        }
    }

    /*if (showCollisions == true)
    {*/
        draw_objects(&obj_BGWall);
    //}
}