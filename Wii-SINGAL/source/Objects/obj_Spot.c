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

ObjectList obj_spot;

void obj_spot_draw() {

    const u8* sprite_index = spr_ball2;

    GRRLIB_texImg *tex_ball2 = GRRLIB_LoadTexturePNG(sprite_index); // Load your texture (replace 'solid' with your actual texture)

    draw_objects(&obj_spot, tex_ball2);

    GRRLIB_FreeTexture(tex_ball2);
}