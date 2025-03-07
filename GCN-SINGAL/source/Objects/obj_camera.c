#include <grrlib.h>

#include "../Sprites/Sprites.h"
#include "../Scripts/Scripts.h"
#include "../Rooms/room.h"
#include "objects.h"
#include "../Extensions/Extensions.h"

int finalCamX = 0, finalCamY = 0;
float camTrailSpd = .25;
float camX, camY;

// Initialize camera properties in the room start function
void oCamera_RoomStart(int Wth, int Hgt, int RmWth, int RmHgt, ObjectList *obj_list) {

    RM_WIDTH = RmWth;
    RM_HEIGHT = RmHgt;

    view_camera[0].CamWidth = Wth;
    view_camera[0].CamHeight = Hgt;
    float camWidth = view_camera[0].CamWidth;
    float camHeight = view_camera[0].CamHeight;

    // Calculate initial camera position centered on the player

    if (obj_list != NULL){
        for (int i = 0; i < obj_list->numObjects; ++i) {
            // Assuming you have a pointer or reference to the player object
            GameObject* ActObj = obj_list->objects[i];  // Modify this if your player object is different
            camX = ActObj->x - camWidth / 2;
            camY = ActObj->y - camHeight / 2;
        }
    } else {
        camX = 0 - camWidth / 2;
        camY = 0 - camHeight / 2;
    }


    // Constrain camera to room boundaries
    camX = clamp(camX, 0, RmWth - camWidth);
    camY = clamp(camY, 0, RmHgt - camHeight);

    // Set the initial camera position
    finalCamX = camX;
    finalCamY = camY;

    // Set the camera view position
    camera_set_view_pos(0, finalCamX, finalCamY);
}

void obj_camera(int Wth, int Hgt, ObjectList *obj_list, int view_id, int RmWth, int RmHgt) {

    view_camera[0].CamWidth = Wth;
    view_camera[0].CamHeight = Hgt;
    /*float maxCameraX = ROOM_WIDTH - obj_game_camera.CamWidth;
    float maxCameraY = ROOM_HEIGHT - obj_game_camera.CamHeight;*/

    float camWidth = view_camera[0].CamWidth;
    float camHeight = view_camera[0].CamHeight;

    if (obj_list != NULL){
        for (int i = 0; i < obj_list->numObjects; ++i) {
            GameObject* GameObject = obj_list->objects[i];
            if (GameObject != NULL) {
                // Calculate the desired camera position centered on the player
                camX = GameObject->x - camWidth / 2;
                camY = GameObject->y - camHeight / 2;
            }
        }
    } else {
        camX = 0 - camWidth / 2;
        camY = 0 - camHeight / 2;
    }

    // Constrain camera to room boundaries
    camX = clamp(camX, 0, RmWth - camWidth);
    camY = clamp(camY, 0, RmHgt - camHeight);

    // Apply a smoothing effect to the camera position
    finalCamX += (camX - finalCamX) * camTrailSpd;
    finalCamY += (camY - finalCamY) * camTrailSpd;

    // Update the camera view position
    camera_set_view_pos(0, finalCamX, finalCamY);
}

// Define BG and backgroundInitialized at file scope
static GRRLIB_texImg* BG = NULL;
static const char* currentBGSprite = NULL;

void room_background(const u8* BG_Sprite) {
    // Only reload the background texture if it's different from the current one
    if (currentBGSprite == NULL || strcmp((const char*)BG_Sprite, currentBGSprite) != 0) {
        // Free the previous background texture if it has been initialized
        /*if (BG != NULL) {
            GRRLIB_FreeTexture(BG);
        }*/

        // Load the new background texture
        BG = GRRLIB_LoadTexture(BG_Sprite);
        if (BG != NULL) {
            currentBGSprite = (const char*)BG_Sprite;
        }
    }

    // Draw the background only if the texture is loaded
    if (BG != NULL) {
        // Calculate camera offset
        int ObjCamX = view_camera[0].CamX;
        int ObjCamY = view_camera[0].CamY;

        int camX = ObjCamX % BG->w;
        int camY = ObjCamY % BG->h;

        // Draw the background in a tiled pattern
        for (int y = -BG->h; y < view_camera[0].CamHeight + BG->h; y += BG->h) {
            for (int x = -BG->w; x < view_camera[0].CamWidth + BG->w; x += BG->w) {
                drawing2(x - camX, y - camY, LAYER_BACKGROUND, BG, 0, 1, 1, GRRLIB_WHITE);
            }
        }
    }

    //GRRLIB_FlushTex(BG);
}

void room_background_cleanup() {
    // Free the background texture if it has been loaded
    if (BG != NULL) {
        //GRRLIB_ClearTex(BG);
        GRRLIB_FreeTexture(BG);
        BG = NULL;
        currentBGSprite = NULL; // Reset current background sprite
    }
}

void rm_loop_bg_clean(){
    GRRLIB_FreeTexture(BG);
}