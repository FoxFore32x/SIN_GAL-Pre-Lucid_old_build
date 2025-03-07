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

void obj_slope_draw(bool showCollisions) {

    const u8* sprite_index = spr_slope;

    GRRLIB_texImg *tex_slope = GRRLIB_LoadTexturePNG(sprite_index); // Load your texture (replace 'solid' with your actual texture)

    if (showCollisions == true)
    {
        draw_objects(&obj_slope_list, tex_slope);

        GRRLIB_FreeTexture(tex_slope);
    }
}