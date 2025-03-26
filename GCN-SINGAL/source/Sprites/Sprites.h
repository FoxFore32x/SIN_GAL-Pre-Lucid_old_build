#ifndef _SPRITES_H_
#define _SPRITES_H_

#include <stdint.h>
#include <grrlib.h>

#define GRRLIB_BLACK   0x000000FF
#define GRRLIB_MAROON  0x800000FF
#define GRRLIB_GREEN   0x008000FF
#define GRRLIB_OLIVE   0x808000FF
#define GRRLIB_NAVY    0x000080FF
#define GRRLIB_PURPLE  0x800080FF
#define GRRLIB_TEAL    0x008080FF
#define GRRLIB_GRAY    0x808080FF
#define GRRLIB_SILVER  0xC0C0C0FF
#define GRRLIB_RED     0xFF0000FF
#define GRRLIB_LIME    0x00FF00FF
#define GRRLIB_YELLOW  0xFFFF00FF
#define GRRLIB_BLUE    0x0000FFFF
#define GRRLIB_FUCHSIA 0xFF00FFFF
#define GRRLIB_AQUA    0x00FFFFFF
#define GRRLIB_WHITE   0xFFFFFFFF
#define GRRLIB_TRANSPARENT 0x00000000 // Fully transparent (alpha = 0)


#define MAX_SPRITES 100 // Adjust the maximum number of objects as needed

//Collision Mask's Types

enum CollisionTypes {
    RECTANGLE,
    RECTANGLE_WITH_ROTATION,
    ELIPSE,          // Assign unique values to each room
    PRECISE,
    PRECISE_BY_FRAME,
    SPINE_COLLISION_MESH
};

typedef struct {
    const unsigned char *spriteData;
    int spriteSize;
    int left;
    int right;
    int top;
    int bottom;
    int originX;
    int originY;
    int XScale;
    int YScale;
    int GenWidth;
    int GenHeight;
    int Type;
    union { bool *p, *pixels; };
    GRRLIB_texImg *texture;
} SpriteWithCollision;

extern SpriteWithCollision* currentSprite;

typedef struct {
    SpriteWithCollision* sprites[MAX_SPRITES];
    int numSprites;
} SpriteAsset;

// Function prototype for initializing a sprite
//void initializeSprite(SpriteWithCollision *sprite, const unsigned char *data, int size, int left, int right, int top, int bottom, int originX, int originY);

//GRRLIB
#include "test/ball.h"
#include "test/TESTBG.h"

//Technical
#include "Collision/solid.h"
#include "Collision/spr_slope.h"
#include "Collision/spr_insSolid.h"
#include "Collision/tex_BGwall.h"
#include "Collision/tex_Warp.h"
#include "Assets/spr_teoriIcontest.h"
#include "Assets/spr_ball2.h"
#include "Assets/tex_feltree.h"

//Backgrounds
#include "Backgrounds/bg_test.h"
#include "test/TESTBG.h"
#include "Backgrounds/bg_temp.h"
#include "Backgrounds/TITLEBGTEST.h"
#include "Backgrounds/craziidab.h"
#include "Backgrounds/menu.h"

//Teori Prototype
#include "TeoriTEST/TeoriIdletest.h"
#include "TeoriTEST/TeoriWalktest.h"
#include "TeoriTEST/teoriJump.h"
#include "TeoriTEST/teoriFall.h"
#include "TeoriTEST/teoriCrouch.h"
#include "TeoriTEST/teoriSlide.h"
#include "TeoriTEST/TeoriRun1.h"
#include "TeoriTEST/TeoriRun2.h"
#include "TeoriTEST/teoriDoubleJump.h"

#include "HUD/spr_TeoriState.h"
#include "HUD/spr_StateBar.h"

#include "quispe.h"

void initialize_sprite();

/*#define MAX_TEXTURES 8 // Define the maximum number of textures you want to load

GRRLIB_texImg *spr_player[MAX_TEXTURES];*/

#endif