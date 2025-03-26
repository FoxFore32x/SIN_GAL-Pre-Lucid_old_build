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

ObjectList obj_insSolid;

void obj_insSolid_draw(bool showCollisions) {

    for (int i = 0; i < obj_insSolid.numObjects; ++i) {
        GameObject* currentObject = obj_insSolid.objects[i];
        if (currentObject != NULL) {
            currentObject->collision_mask = sp_insSolid;
        }
    }

    /*if (showCollisions == true)
    {*/
        draw_objects(&obj_insSolid);
    //}
}