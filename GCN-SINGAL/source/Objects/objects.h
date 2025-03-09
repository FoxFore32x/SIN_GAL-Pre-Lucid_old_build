// room_content.h
#ifndef OBJECTS_H
#define OBJECTS_H

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
#include <stdbool.h>
#include "../Sprites/Sprites.h"

// Add a constant for the maximum number of camera views
#define MAX_VIEWS 8

#define ROOM_WIDTH 4000 // Set your game world width
#define ROOM_HEIGHT 1024 // Set your game world height

extern int RM_WIDTH, RM_HEIGHT;

// Define the default width of the camera
#define DEFAULT_CAMERA_WIDTH_4_3 640
#define DEFAULT_CAMERA_WIDTH_16_9 854

// Determine the default width based on the aspect ratio
#define DEFAULT_CAMERA_WIDTH (scrnWidth == 854 ? DEFAULT_CAMERA_WIDTH_16_9 : DEFAULT_CAMERA_WIDTH_4_3)

#define MAX_OBJECTS 100 // Adjust the maximum number of objects as needed

#define TILE_WIDTH 32
#define TILE_HEIGHT 32

//GRRLIB_texImg* tex_solid; // Load your texture (replace 'solid' with your actual texture)

typedef enum {
    LAYER_BACKGROUND = 0,
    LAYER_BG_WALL = 4,
    LAYER_SOLID = 8,
    LAYER_PLAYER = 12,
    LAYER_SCREEN = 16,
    // Add more layers as needed
    LAYER_COUNT
} Layer;

typedef struct {
    int id;
    float x;
    float y;
    int width;
    int height;
    float currentWidth;
    float currentHeight;
    int depth;  // New depth field for draw order
    SpriteWithCollision collision_mask;
    Layer layer;
    GRRLIB_texImg* texture;
    bool persistent;
    //struct GameList* parent;
    struct ObjectList* descendant; //User doesn't change it's value, it's the program who does the dirty work

    void *Create;
} GameObject;

extern GameObject* currentObject; // Pointer to an array of GameObject pointers

typedef struct {
    GameObject* objects[MAX_OBJECTS];
    int numObjects;
    bool initialized;  // New flag to track initialization status
} ObjectList;

typedef struct {
    ObjectList* Descen;
    ObjectList* Parent;
} ParObj;

#define OBJECT_ENTRY(obj, persistent) { &obj, persistent }

extern ObjectList Background;

extern ObjectList obj_player2;
extern ObjectList obj_solid;
extern ObjectList obj_slope;
extern ObjectList obj_BGWall;
extern ObjectList obj_pointer;
extern ObjectList obj_spot;
extern ObjectList obj_Warp;
extern ObjectList obj_WarpController;

extern ObjectList* RmObjLst[1000];

typedef struct{
    float CamX;
    float CamY;
    float CamWidth;  // Camera width
    float CamHeight; // Camera height
} Camera;

extern Camera obj_game_camera;

extern Camera view_camera[MAX_VIEWS];

extern int numSolidObjects;

#include "obj_player.h"
#include "obj_Warp.h"

void obj_player_Step();

void obj_player_Draw();

void obj_solid_draw(bool showCollisions);

void obj_BGWall_draw(bool showCollisions);

void obj_slope_draw(bool showCollisions);

void obj_pointer_draw();

void obj_spot_draw();

void oCamera_RoomStart(int Wth, int Hgt, int RmWth, int RmHgt, ObjectList *obj_list);
void obj_camera(int Wth, int Hgt, ObjectList *obj_list, int view_id, int RmWth, int RmHgt);
void room_background(const u8* BG_Sprite);
void rm_loop_bg_clean();
void room_background_cleanup();


#endif // OBJECTS_H