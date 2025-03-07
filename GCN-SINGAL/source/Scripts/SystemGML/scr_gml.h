// scr_gml.h
#ifndef SCR_GML_H
#define SCR_GML_H

#include "../../Objects/objects.h"
//#include "mpeg/mpeg.h"

#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 480

extern GRRLIB_ttfFont *DEBUGFnt;

typedef struct {
    char* name;
    bool value;  // Change type from int to bool
} var;

extern int currentRoom;

void drawing2(const f32 xpos, const f32 ypos, const f32 zpos, const GRRLIB_texImg *tex, const f32 degrees, const f32 scaleX, const f32 scaleY, const u32 color);

void CalculateFPS();
void DrawFPS();

int abs_int(int value);
float abs_float(float value);
double abs_double(double value);

int max(int count, ...);

//bool place_meeting(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2);
void obj_init(ObjectList *obj_list);
void obj_add(ObjectList *obj_list, float x, float y, float width, float height, SpriteWithCollision *sprite, Layer layer, ObjectList *parent);
int clamp(int value, int min, int max);
void InitializeScreenCapture();
void CaptureScreenToTexture();
void DrawCapturedScreen();
void sort_objects_by_depth(ObjectList *obj_list);
void draw_objects(ObjectList* obj_list, SpriteWithCollision* defaultSprite, int image_xscale, int image_yscale);
GameObject* instance_create(ObjectList *obj_list, float x, float y, float width, float height, SpriteWithCollision *sprite, Layer layer, bool persistent, ObjectList *parent);
void draw_sprite(SpriteWithCollision sprite_index, int image_index, float x, float y);
void obj_cleanup(ObjectList *obj_list);
void RmClean();
bool place_meeting(float x, float y, ObjectList *obj_list);
int array_length(var variables[], int maxVariables);
bool move_and_collide(float *x, float *y, float dx, float dy, ObjectList *obj_list);
bool instance_exists(ObjectList *obj_list);
void instance_destroy(ObjectList *obj_list);
int sign(float x);
void room_goto(int selRoom);
void room_goto_next();
void initialize_view_cameras();
void camera_set_view_pos(int view_id, float x, float y);

//audio play mp3
int mp3Reader(void *cbdata, void *dst, int size);
void* readOggFile(const char* filepath, size_t* fileSize);
void audio_play_sound(const char* BGM, /*size_t BGM_size,*/ bool loop);

//Draw
void draw_set_color(u32 color);
void draw_set_alpha(float alpha);
void draw_rectangle(float x1, float y1, float x2, float y2, bool filled);


#endif // SCR_GML_H