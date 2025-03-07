#include "scr_gml.h"

typedef struct {
    union {
        struct { uint8_t b, g, r, a; };
        uint32_t u32;
    };
} pixel_t;

typedef struct {
    union { int w, width; };
    union { int h, height; };
    union { pixel_t *p, *pixels; };
} sprite_t;

typedef struct {
    union { int w, width; };
    union { int h, height; };
    union { bool *p, *pixels; };
    GRRLIB_texImg *texture;
} collision_mask_t;

bool CollisionMaskFromSprite (collision_mask_t *mask, sprite_t *sprite, GRRLIB_texImg *Texture, int w, int h);
bool CheckCollision (collision_mask_t* a, int ax, int ay, collision_mask_t* b, int bx, int by);
bool CheckCollisionRECaPREC (SpriteWithCollision a, float ax, float ay, int aw, int ah, SpriteWithCollision b, float bx, float by, int bw, int bh);