#include <grrlib.h>

#include "objects.h"
#include "../Sprites/Sprites.h"
#include "../Scripts/Video/scr_video.h"

void obj_camera(int Wth, int Hgt, ObjectList *obj_list) {

    obj_game_camera.CamWidth = Wth;
    obj_game_camera.CamHeight = Hgt;
    float maxCameraX = ROOM_WIDTH - obj_game_camera.CamWidth;
    float maxCameraY = ROOM_HEIGHT - obj_game_camera.CamHeight;

    // Update camera position to follow the player
    for (int i = 0; i < obj_list->numObjects; ++i) {
        GameObject* currentObject = obj_list->objects[i];
        if (currentObject != NULL) {
            obj_game_camera.CamX = /*obj_player.x*/currentObject->x - obj_game_camera.CamWidth / 2;
            obj_game_camera.CamY = /*obj_player.y*/currentObject->y - obj_game_camera.CamHeight / 2;

            // Ensure camera stays within room boundaries
            if (obj_game_camera.CamX < 0) {
                obj_game_camera.CamX = 0;
            } else if (obj_game_camera.CamX > maxCameraX) {
                obj_game_camera.CamX = maxCameraX;
            }

            if (obj_game_camera.CamY < 0) {
                obj_game_camera.CamY = 0;
            } else if (obj_game_camera.CamY > maxCameraY) {
                obj_game_camera.CamY = maxCameraY;
            }
        }
    }
}

// Define BG and backgroundInitialized at file scope
static GRRLIB_texImg* BG = NULL;
static const char* currentBGSprite = NULL;

void room_background(const u8* BG_Sprite) {
    // Only reload the background texture if it's different from the current one
    if (currentBGSprite == NULL || strcmp((const char*)BG_Sprite, currentBGSprite) != 0) {
        // Free the previous background texture if it has been initialized
        if (BG != NULL) {
            GRRLIB_FreeTexture(BG);
        }

        // Load the new background texture
        BG = GRRLIB_LoadTexture(BG_Sprite);
        if (BG != NULL) {
            currentBGSprite = (const char*)BG_Sprite;
        }
    }

    // Draw the background only if the texture is loaded
    if (BG != NULL) {
        // Calculate camera offset once
        int camX = 0 - obj_game_camera.CamX;
        int camY = 0 - obj_game_camera.CamY;
        
        GRRLIB_DrawImg(camX, camY, BG, 0, 1, 1, GRRLIB_WHITE);
    }
}

void room_background_cleanup() {
    // Free the background texture if it has been loaded
    if (BG != NULL) {
        GRRLIB_FreeTexture(BG);
        BG = NULL;
        currentBGSprite = NULL; // Reset current background sprite
    }
}
