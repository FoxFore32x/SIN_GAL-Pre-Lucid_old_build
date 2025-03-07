#ifndef _SPRITES_H_
#define _SPRITES_H_

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

//GRRLIB
#include "test/ball.h"

//Technical
#include "solid.h"
#include "spr_slope.h"
#include "tex_BGwall.h"
#include "spr_teoriIcontest.h"
#include "spr_ball2.h"

//Backgrounds
#include "bg_test.h"
#include "test/TESTBG.h"
#include "bg_temp.h"

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
#include "TITLEBGTEST.h"
#include "craziidab.h"

/*#define MAX_TEXTURES 8 // Define the maximum number of textures you want to load

GRRLIB_texImg *spr_player[MAX_TEXTURES];*/

#endif