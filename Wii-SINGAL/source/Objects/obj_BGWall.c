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
#include "../Rooms/room.h"
#include "objects.h"
#include "../Scripts/Input/input.h"

ObjectList obj_BGWall_list;

void obj_BGWall_draw(bool showCollisions) {

    const u8* sprite_index = tex_BGwall;

    GRRLIB_texImg *sprite_BGWall = GRRLIB_LoadTexturePNG(sprite_index); // Load your texture

    if (showCollisions == true)
    {
        draw_objects(&obj_BGWall_list, sprite_BGWall);

        GRRLIB_FreeTexture(sprite_BGWall);
    }
}