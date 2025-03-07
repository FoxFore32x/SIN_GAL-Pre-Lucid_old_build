#include <grrlib.h>
#include <ogc/video.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>
#include <stdarg.h>
#include <pngu.h>
//#include <wiiuse/wpad.h>
#include <mp3player.h>
#include <stdio.h>
#include <asndlib.h>
#include <gctypes.h>
#include <unistd.h> // For usleep()
#include <gccore.h>
//#include <pngu.h>
#include <ogc/lwp.h>  // For threading
#include <ogc/lwp_watchdog.h> // For gettime() and ticks_to_secs()
#include <ogc/mutex.h>  // For mutex if needed

#include "GRRLIB_ZMod.h"
#include "Kero.h"
#include "scr_gml.h"
#include "../../Rooms/room.h"
#include "../../Objects/objects.h"
#include "../../Sprites/Sprites.h"
#include "../Scripts.h"
#include "../../Extensions/Extensions.h"

//THIS CODE WAS MADE BY: Nick Walton A.K.A Croaking Kero.
//Youtube Tutorial can be found here: https://www.youtube.com/watch?v=9pnEBa4cy5w
//Link to code: https://croakingkero.com/tutorials/pixel_collision_detection

bool CollisionMaskFromSprite (collision_mask_t *mask, sprite_t *sprite, GRRLIB_texImg *Texture, int w, int h) {

    sprite->h = h;
    sprite->w = w;

    for (u32 y = 0; y < Texture->h; y++) {
        for (u32 x = 0; x < Texture->w; x++) {
            const u32 color = GRRLIB_GetPixelFromtexImg(x, y, Texture);
            
            sprite->p->u32 = color;
            sprite->p->r = R(GRRLIB_GetPixelFromtexImg(x, y, Texture));
            sprite->p->g = G(GRRLIB_GetPixelFromtexImg(x, y, Texture));
            sprite->p->b = B(GRRLIB_GetPixelFromtexImg(x, y, Texture));
            sprite->p->a = A(GRRLIB_GetPixelFromtexImg(x, y, Texture));
        }
    }

    mask->w = sprite->w;
    mask->h = sprite->h;
    int total = mask->w * mask->h;
    mask->p = malloc (total);
    if (!mask->p) {
        return false;
    }

    bool *m = mask->p;
    pixel_t *s = sprite->p;
    while (total--) {
        *m = s->a == 0 ? 0 : 1;
        ++m; ++s;
    }
    return true;
}


bool CheckCollision (collision_mask_t* a, int ax, int ay, collision_mask_t* b, int bx, int by) {
	int aleft, aright, abottom, atop;
	int bleft, bright, bbottom, btop;
	int left, right, bottom, top;
	int columns, rows;

	aleft = ax; aright = aleft + a->w-1;
	abottom = ay; atop = abottom + a->h-1;

	bleft = bx; bright = bleft + b->w-1;
	bbottom = by; btop = bbottom + b->h-1;

	if (aleft > bright || aright < bleft || abottom > btop || atop < bbottom)
		return false; // Collision box areas do not overlap

	// Bounding box of overlap of two masks
	left = MAX (aleft, bleft);
	right = MIN (aright, bright);
	bottom = MAX (abottom, bbottom);
	top = MIN (atop, btop);
	columns = right - left + 1;
	rows = top - bottom + 1;

	aleft = left - aleft;
	abottom = bottom - abottom;

	bleft = left - bleft;
	bbottom = bottom - bbottom;

	for (int y = 0; y < rows; ++y) {
		for (int x = 0; x < columns; ++x) {
			if (a->p[(aleft + x) + (abottom + y) * a->w] &&
				b->p[(bleft + x) + (bbottom + y) * b->w])
				return true;
		}
	}

	return false;
}

bool CheckCollisionRECaPREC (SpriteWithCollision a, float ax, float ay, int aw, int ah, SpriteWithCollision b, float bx, float by, int bw, int bh) {

	int aleft, aright, abottom, atop;
	int bleft, bright, bbottom, btop;
	int left, right, bottom, top;
	int columns, rows;

	aleft = ax; aright = aleft + aw-1;
	abottom = ay; atop = abottom + ah-1;

	bleft = bx; bright = bleft + bw-1;
	bbottom = by; btop = bbottom + bh-1;

	if (aleft > bright || aright < bleft || abottom > btop || atop < bbottom)
		return false; // Collision box areas do not overlap

	// Bounding box of overlap of two masks
	left = MAX (aleft, bleft);
	right = MIN (aright, bright);
	bottom = MAX (abottom, bbottom);
	top = MIN (atop, btop);
	columns = right - left + 1;
	rows = top - bottom + 1;

	aleft = left - aleft;
	abottom = bottom - abottom;

	bleft = left - bleft;
	bbottom = bottom - bbottom;

	for (int y = 0; y < rows; ++y) {
		for (int x = 0; x < columns; ++x) {
			if (a.p[(aleft + x) + (abottom + y) * aw] &&
				b.p[(bleft + x) + (bbottom + y) * bw])
				return true;
		}
	}

	return false;
}