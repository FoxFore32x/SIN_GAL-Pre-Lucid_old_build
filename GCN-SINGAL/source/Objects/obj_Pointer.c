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

ObjectList obj_pointer;

void obj_pointer_draw() {

    const u8* sprite_index = spr_teoriIcontest;

    GRRLIB_texImg *tex_icon2 = GRRLIB_LoadTexturePNG(sprite_index); // Load your texture (replace 'solid' with your actual texture)
    
    for (int i = 0; i < obj_pointer.numObjects; ++i) {
        GameObject* currentObject = obj_pointer.objects[i];
        if (currentObject != NULL) {
            currentObject->texture = tex_icon2;
        }
    }

    draw_objects(&obj_pointer, &sprite_teoriIcontest, 1, 1);

    GRRLIB_FreeTexture(tex_icon2);
}