// room_content.h
#ifndef OBJECTS_H
#define OBJECTS_H

#define ROOM_WIDTH 4000 // Set your game world width
#define ROOM_HEIGHT 1024 // Set your game world height

// Define the default width of the camera
#define DEFAULT_CAMERA_WIDTH_4_3 640
#define DEFAULT_CAMERA_WIDTH_16_9 854

// Determine the default width based on the aspect ratio
#define DEFAULT_CAMERA_WIDTH (scrnWidth == 854 ? DEFAULT_CAMERA_WIDTH_16_9 : DEFAULT_CAMERA_WIDTH_4_3)

#define MAX_OBJECTS 100 // Adjust the maximum number of objects as needed

#define TILE_WIDTH 32
#define TILE_HEIGHT 32

#include "../Scripts/Video/scr_video.h"

//GRRLIB_texImg* tex_solid; // Load your texture (replace 'solid' with your actual texture)

typedef struct {
    float x;
    float y;
    float width;
    float height;
} GameObject;

typedef struct {
    GameObject* objects[MAX_OBJECTS];
    int numObjects;
} ObjectList;

extern ObjectList obj_player2;
extern ObjectList obj_solid_list;
extern ObjectList obj_slope_list;
extern ObjectList obj_BGWall_list;
extern ObjectList obj_pointer;
extern ObjectList obj_spot;

typedef struct{
    float x;
    float y;
    float grv;
    float hsp;
    float vsp;
    float spd;
    float pyrRunTime;
    float spdTimer;
    float sspStop;
    int jumpCnt;
    bool canJump;
    bool isJumping;
    bool isCrouching;
    bool isSliding;
    bool slideEnded;
    bool isBGGrab;
    int slide_momentum;
    int slidingTimer;
    int image_xscale;
    int direction;
    const u8* sprite_index;

} obj_player_Vars;

extern obj_player_Vars obj_player;

extern GRRLIB_texImg *tex_teoriIdle;

extern GRRLIB_texImg *sprite_BGWall;

extern GRRLIB_texImg *tex_solid;

extern GRRLIB_texImg *tex_slope;

extern GRRLIB_texImg *tex_icon2;

extern GRRLIB_texImg *tex_ball2;

typedef struct{
    float CamX;
    float CamY;
    float CamWidth;  // Camera width
    float CamHeight; // Camera height
} Camera;

extern Camera obj_game_camera;

extern int numSolidObjects;

void obj_player_Create(float XPos, float YPos);
void obj_player_Step();

//OBJECTS ADAPTED TO ENGINE

void obj_player2_Step();

void obj_solid_draw(bool showCollisions);

void obj_BGWall_draw(bool showCollisions);

void obj_slope_draw(bool showCollisions);

void obj_pointer_draw();

void obj_spot_draw();

void obj_camera(int Wth, int Hgt, ObjectList *obj_list);
void room_background(const u8* BG_Sprite);
void room_background_cleanup();

int mp3Reader(void *cbdata, void *dst, int size);
void play(const char *BG_music);
void obj_music(const char* BGM, /*size_t BGM_size,*/ bool loop);

#endif // OBJECTS_H