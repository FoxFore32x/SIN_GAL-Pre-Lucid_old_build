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

#include "GRRLIB_ZMod.h"
#include "scr_gml.h"
#include "Kero.h"
#include "../../Rooms/room.h"
#include "../../Objects/objects.h"
#include "../../Sprites/Sprites.h"
#include "../Scripts.h"
#include "../../Extensions/Extensions.h"

Camera obj_game_camera;

int currentRoom;

int RoomChanged;

ObjectList* RmObjLst[1000];

extern GRRLIB_drawSettings GRRLIB_Settings;
extern Mtx                 GXmodelView2D;

static guVector axis = (guVector){0, 0, 1};

void drawing2(const f32 xpos, const f32 ypos, const f32 zpos, const GRRLIB_texImg *tex, const f32 degrees, const f32 scaleX, const f32 scaleY, const u32 color) {
    GXTexObj  texObj;
    Mtx       m, m1, m2, mv;

    if (tex == NULL || tex->data == NULL)
        return;

    GX_InitTexObj(&texObj, tex->data, tex->w, tex->h,
                  GX_TF_RGBA8, GX_CLAMP, GX_CLAMP, GX_FALSE);

    if (GRRLIB_Settings.antialias == false) {
        GX_InitTexObjLOD(&texObj, GX_NEAR, GX_NEAR,
                         0.0f, 0.0f, 0.0f, 0, 0, GX_ANISO_1);
        GX_SetCopyFilter(GX_FALSE, rmode->sample_pattern, GX_FALSE, rmode->vfilter);
    }
    else {
        GX_SetCopyFilter(rmode->aa, rmode->sample_pattern, GX_TRUE, rmode->vfilter);
    }

    GX_LoadTexObj(&texObj,      GX_TEXMAP0);
    GX_SetTevOp  (GX_TEVSTAGE0, GX_MODULATE);
    GX_SetVtxDesc(GX_VA_TEX0,   GX_DIRECT);

    guMtxIdentity  (m1);
    guMtxScaleApply(m1, m1, scaleX, scaleY, 1.0);
    guMtxRotAxisDeg(m2, &axis, degrees);
    guMtxConcat    (m2, m1, m);

    const f32 width  = tex->w * 0.5;
    const f32 height = tex->h * 0.5;

    guMtxTransApply(m, m,
        xpos +width  +tex->handlex
            -tex->offsetx +( scaleX *(-tex->handley *sin(-DegToRad(degrees))
                                      -tex->handlex *cos(-DegToRad(degrees))) ),
        ypos +height +tex->handley
            -tex->offsety +( scaleY *(-tex->handley *cos(-DegToRad(degrees))
                                      +tex->handlex *sin(-DegToRad(degrees))) ),
        zpos);
    guMtxConcat(GXmodelView2D, m, mv);

    GX_LoadPosMtxImm(mv, GX_PNMTX0);
    GX_Begin(GX_QUADS, GX_VTXFMT0, 4);
        GX_Position3f32(-width, -height, 0);
        GX_Color1u32   (color);
        GX_TexCoord2f32(0, 0);

        GX_Position3f32(width, -height, 0);
        GX_Color1u32   (color);
        GX_TexCoord2f32(1, 0);

        GX_Position3f32(width, height, 0);
        GX_Color1u32   (color);
        GX_TexCoord2f32(1, 1);

        GX_Position3f32(-width, height, 0);
        GX_Color1u32   (color);
        GX_TexCoord2f32(0, 1);
    GX_End();
    GX_LoadPosMtxImm(GXmodelView2D, GX_PNMTX0);

    GX_SetTevOp  (GX_TEVSTAGE0, GX_PASSCLR);
    GX_SetVtxDesc(GX_VA_TEX0,   GX_NONE);
}

// Function declarations for integer and floating-point absolute values
int abs_int(int value) {
    return (value < 0) ? -value : value;
}

float abs_float(float value) {
    return (value < 0.0f) ? -value : value;
}

double abs_double(double value) {
    return (value < 0.0) ? -value : value;
}

// Function to find the maximum value among multiple integers
int max(int count, ...) {
    va_list args;
    va_start(args, count);

    // Retrieve the first argument
    int max_val = va_arg(args, int);

    // Loop through remaining arguments
    for (int i = 1; i < count; i++) {
        int current = va_arg(args, int);
        if (current > max_val) {
            max_val = current;
        }
    }

    va_end(args);
    return max_val;
}

// Declare variables for FPS and font
static float fps = 0.0f;
GRRLIB_ttfFont *font;

void CalculateFPS() {
    static u64 lastTime = 0;
    static int frameCount = 0;
    u64 currentTime = gettime();

    // Increment the frame counter
    frameCount++;

    // Check if one second has passed
    if (ticks_to_secs(currentTime - lastTime) >= 1.0f) {
        fps = frameCount / ticks_to_secs(currentTime - lastTime);
        frameCount = 0;  // Reset the frame counter
        lastTime = currentTime;  // Update the last time
    }
}

void DrawFPS() {
    font = GRRLIB_LoadTTF(fot_ttf, fot_ttf_size);
    char fpsText[16];
    snprintf(fpsText, sizeof(fpsText), "FPS: %.2f", fps);

    // Draw FPS text
    GRRLIB_PrintfTTF(20, 20, font, fpsText, 20, 0xFFFFFFFF);
    GRRLIB_FreeTTF(font);
}

void DrawDEBUG(int x, int y, const char *format, ...) {
    // Load font
    font = GRRLIB_LoadTTF(fot_ttf, fot_ttf_size);

    // Prepare the variable argument list
    char displaytext[256]; // Buffer for formatted string
    va_list args;
    va_start(args, format);

    // Format the string
    vsnprintf(displaytext, sizeof(displaytext), format, args);
    va_end(args);

    // Draw the formatted text
    GRRLIB_PrintfTTF(x, y, font, displaytext, 15, 0xFFFFFFFF);
    GRRLIB_FreeTTF(font);
}

void DrawDEBUGSimple(int x, int y, const char *format) {
    // Load font
    font = GRRLIB_LoadTTF(fot_ttf, fot_ttf_size);

    // Prepare the variable argument list
    char displaytext[50]; // Buffer for formatted string

    // Format the string
    snprintf(displaytext, sizeof(displaytext), format);

    // Draw the formatted text
    GRRLIB_PrintfTTF(x, y, font, displaytext, 20, 0xFFFFFFFF);
    GRRLIB_FreeTTF(font);
}

ObjectList *CurrObjLst;

// Function to initialize objects
void obj_init(ObjectList *obj_list) {
    obj_list->numObjects = 0;
    for (int i = 0; i < MAX_OBJECTS; ++i) {
        obj_list->objects[i] = NULL;
        CurrObjLst = obj_list;
        obj_list->initialized = true;
    }
}

ParObj descObject;

void obj_add(ObjectList *obj_list, float x, float y, float width, float height, SpriteWithCollision *sprite, Layer layer, ObjectList *parent) {
    if (obj_list->numObjects < MAX_OBJECTS) {
        GameObject* newObject = (GameObject*)malloc(sizeof(GameObject));
        if (newObject != NULL) {
            newObject->x = x;
            newObject->y = y;
            newObject->layer = layer;
            if (parent != NULL) {
                for (int i = 0; i < parent->numObjects; ++i) {
                    descObject.Descen = obj_list;
                    descObject.Parent = parent;
                }
            }

            newObject->texture = GRRLIB_LoadTexture(sprite->spriteData);
            newObject->collision_mask.left = sprite->left;
            newObject->collision_mask.right = sprite->right;
            newObject->collision_mask.top = sprite->top;
            newObject->collision_mask.bottom = sprite->bottom;
            newObject->collision_mask.originX = sprite->originX;
            newObject->collision_mask.originY = sprite->originY;
            newObject->collision_mask.GenWidth = sprite->GenWidth;
            newObject->collision_mask.GenHeight = sprite->GenHeight;
            newObject->collision_mask.Type = sprite->Type;

            newObject->width = width * sprite->GenWidth;
            newObject->height = height * sprite->GenHeight;
            
            obj_list->objects[obj_list->numObjects++] = newObject;
        }
    }
}


// Function to clamp a value between a minimum and maximum range
int clamp(int value, int min, int max) {
    if (value < min) {
        return min;
    } else if (value > max) {
        return max;
    } else {
        return value;
    }
}

/*int compareLayers(const void *a, const void *b) {
    GameObject *objA = *(GameObject **)a;
    GameObject *objB = *(GameObject **)b;
    return objA->layer - objB->layer;
}

void sort_objects_by_layer(ObjectList *obj_list) {
    qsort(obj_list->objects, obj_list->numObjects, sizeof(GameObject*), compareLayers);
}*/

void sort_objects_by_depth(ObjectList *obj_list) {
    for (int i = 0; i < obj_list->numObjects - 1; ++i) {
        for (int j = 0; j < obj_list->numObjects - i - 1; ++j) {
            if (obj_list->objects[j]->depth > obj_list->objects[j + 1]->depth) {
                GameObject *temp = obj_list->objects[j];
                obj_list->objects[j] = obj_list->objects[j + 1];
                obj_list->objects[j + 1] = temp;
            }
        }
    }
}

// Global or outside the main loop
GRRLIB_texImg *screenTexture = NULL;

void InitializeScreenCapture() {
    // Create an empty texture with the same resolution as the screen
    screenTexture = GRRLIB_CreateEmptyTexture(rmode->fbWidth, rmode->efbHeight);
}

void CaptureScreenToTexture() {
    // Capture the screen to the texture
    GRRLIB_Screen2Texture(0, 0, screenTexture, GX_FALSE);
}

void DrawCapturedScreen() {
    // Draw the captured texture back onto the screen
    drawing2(0, 0, LAYER_SCREEN, screenTexture, 0, 1, 1, GRRLIB_WHITE);
}

// Define number of threads
#define NUM_THREADS 10

// Mutex for synchronizing texture loading
lwp_t threads[NUM_THREADS];
static GRRLIB_texImg* texture = NULL;
static const unsigned char* lastSpriteData = NULL;
static SpriteWithCollision* globalSprite;
int imageXScale, imageYScale;
float ZLayer;
static ObjectList* globalObjectList;

void draw_objects(ObjectList* obj_list, SpriteWithCollision* funnySprite, int image_xscale, int image_yscale) {
    // Set global for consistency
    globalSprite = funnySprite;
    globalObjectList = obj_list;
    imageXScale = image_xscale;
    imageYScale = image_yscale;

    // Ensure the texture is loaded
    if (lastSpriteData != globalSprite->spriteData) {
        if (texture != NULL) {
            GRRLIB_FreeTexture(texture);
        }
        texture = GRRLIB_LoadTexturePNG(globalSprite->spriteData);
        lastSpriteData = globalSprite->spriteData;
    }

    // Sort objects by depth
    sort_objects_by_depth(obj_list);

    // Draw all objects sequentially
    for (int i = 0; i < globalObjectList->numObjects; ++i) {
        currentObject = globalObjectList->objects[i];
        if (currentObject != NULL) {
            float screenX = (currentObject->x - currentObject->collision_mask.originX - view_camera[0].CamX);
            float screenY = (currentObject->y - currentObject->collision_mask.originY - view_camera[0].CamY);
            float Layer = currentObject->layer;
            float objectWidth = (currentObject->width * imageXScale) / funnySprite->GenWidth;
            float objectHeight = (currentObject->height * imageYScale) / funnySprite->GenHeight;

            GRRLIB_SetHandle(texture, currentObject->collision_mask.originX, currentObject->collision_mask.originY);

            // Draw the object
            drawing2(screenX, screenY, Layer, texture, 0, objectWidth, objectHeight, GRRLIB_WHITE);
        }
    }
}

// Optimized sprite drawing function (single-threaded)
void draw_sprite(SpriteWithCollision sprite_index, int image_index, float x, float y) {
    static GRRLIB_texImg* cachedTexture = NULL;

    // Load the texture only once for the sprite and reuse it
    /*if (cachedTexture == NULL || cachedTexture->data != sprite_index.spriteData) {
        if (cachedTexture != NULL) {
            GRRLIB_FreeTexture(cachedTexture);  // Free the old texture if it exists
        }
        cachedTexture = GRRLIB_LoadTexturePNG(sprite_index.spriteData);  // Load new texture
    }*/

    // Adjusted screen position considering origin
    float screenX = (x - sprite_index.originX - view_camera[0].CamX);
    float screenY = (y - sprite_index.originY - view_camera[0].CamY);

    // Draw the sprite
    drawing2(
        screenX,
        screenY,
        LAYER_SCREEN,
        cachedTexture,
        0, // Rotation
        1, // X scale
        1, // Y scale
        GRRLIB_WHITE
    );
}


void RmClean() {
    rm_loop_bg_clean();
    if (texture != NULL) {
        GRRLIB_FreeTexture(texture);
        texture = NULL;
        lastSpriteData = NULL;
    }
}

// Function to free memory for objects
void obj_cleanup(ObjectList *obj_list) {
    if (obj_list == NULL || obj_list->numObjects == 0) {
        return;  // Nothing to clean
    }

    int newCount = 0;  // New count for persistent objects

    for (int i = 0; i < obj_list->numObjects; ++i) {
        if (obj_list->objects[i]->persistent == false) {
            obj_list->numObjects = 0;
            free(obj_list->objects[i]);  // Free non-persistent object
            obj_list->objects[i] = NULL;
            obj_list->initialized = false;
        }/* else {
            obj_list->objects[newCount++] = obj_list->objects[i];  // Keep persistent objects
        }*/
    }

    obj_list->numObjects = newCount;  // Only keep persistent objects
}

bool instance_exists(ObjectList *obj_list) {
    // Check if the object list contains any objects
    if (obj_list->numObjects > 0) {
        return true;
    }
    return false;
    //return obj_list->initialized;
}

void instance_destroy(ObjectList *obj_list) {
    if (currentObject == NULL || obj_list->numObjects == 0) {
        return;
    }

    // Find the currentObject in the object list
    for (int i = 0; i < obj_list->numObjects; ++i) {
        if (obj_list->objects[i] == currentObject) {
            // Free the memory allocated for the currentObject
            free(currentObject);
            
            // Shift the remaining objects in the list to fill the gap
            for (int j = i; j < obj_list->numObjects - 1; ++j) {
                obj_list->objects[j] = obj_list->objects[j + 1];
            }
            
            // Decrease the object count and nullify the last entry
            obj_list->numObjects--;
            obj_list->objects[obj_list->numObjects] = NULL;
            
            // Reset currentObject to prevent using a dangling pointer
            currentObject = NULL;
            break;
        }
    }
}

void *instance_create(ObjectList *obj_list, float x, float y, float width, float height, SpriteWithCollision *sprite, Layer layer, bool persistent, ObjectList *parent) {
    if (obj_list->numObjects < MAX_OBJECTS) {
        GameObject* newObject = (GameObject*)malloc(sizeof(GameObject));
        if (newObject != NULL) {
            newObject->x = x;
            newObject->y = y;
            newObject->layer = layer;
            if (parent != NULL) {
                for (int i = 0; i < parent->numObjects; ++i) {
                    descObject.Descen = obj_list;
                    descObject.Parent = parent;
                }
            }

            newObject->texture = GRRLIB_LoadTexture(sprite->spriteData);
            newObject->collision_mask.left = sprite->left;
            newObject->collision_mask.right = sprite->right;
            newObject->collision_mask.top = sprite->top;
            newObject->collision_mask.bottom = sprite->bottom;
            newObject->collision_mask.originX = sprite->originX;
            newObject->collision_mask.originY = sprite->originY;
            newObject->collision_mask.GenWidth = sprite->GenWidth;
            newObject->collision_mask.GenHeight = sprite->GenHeight;
            newObject->collision_mask.Type = sprite->Type;

            newObject->width = width * sprite->GenWidth;
            newObject->height = height * sprite->GenHeight;
            newObject->persistent = persistent;
            
            obj_list->objects[obj_list->numObjects++] = newObject;
            
            return newObject;  // Return the new object pointer
        }
    }
    obj_list->initialized = true;

    obj_cleanup(obj_list);
    
    return NULL;  // Return NULL if no object was created
}


// Function to get the length of the array of var variables
int array_length(var variables[], int maxVariables) {
    int count = 0;
    for (int i = 0; i < maxVariables; ++i) {
        if (variables[i].name != NULL) {
            count++;
        } else {
            break; // Assuming names are NULL-terminated
        }
    }
    return count;
}

//######################## COLLISION ##################################

#define btoa(x) ((x)?"true":"false")

bool CheckRectangleVsPrecise(float ALeft, float ATop, float ARight, float ABottom, 
                            const ObjectList *obj_list) {

    if (!obj_list){
        DrawDEBUGSimple(40, 15, "No we.");
        return false;
    }

    if (obj_list->numObjects == 0) {
        return false;
    }

    u32 TexW, TexH;

    bool collisionFound = false;

    for (int i = 0; i < obj_list->numObjects; ++i) {
        GameObject *PrecObj = obj_list->objects[i];
        // Get texture width and height
        TexW = (PrecObj->width);
        TexH = (PrecObj->height);

        float BLeft = (PrecObj->x + PrecObj->collision_mask.left - PrecObj->collision_mask.originX);
        float BTop = (PrecObj->y + PrecObj->collision_mask.top - PrecObj->collision_mask.originY);
        float BRight = (PrecObj->x + PrecObj->collision_mask.right - PrecObj->collision_mask.originX);
        float BBottom = (PrecObj->y + PrecObj->collision_mask.bottom - PrecObj->collision_mask.originY);

        // Calculate the overlapping region in texture space
        int startX = MAX(0, ALeft - BLeft); // Left
        int startY = MAX(0, ATop - BTop);  // Top
        int endX = MIN(ARight - BRight, TexW); // Right
        int endY = MIN(ABottom - BBottom, TexH); // Bottom

        if (ARight >= BLeft && ALeft <= BRight && ABottom >= BTop && ATop <= BBottom){
            return false;
        }

        // Iterate over the overlapping area
        for (int y = startY; y < endY; ++y) {
            for (int x = startX; x < endX; ++x) {
                const u32 color = GRRLIB_GetPixelFromtexImg(x, y, PrecObj->texture);
                int Alp = A(color);

                //DrawDEBUG(40, 15, "Alpha = %.2i", Alp);
                //DrawDEBUG (40, 65, "collisionFound = %.2s", btoa(collisionFound));

                // Check if the alpha is greater than zero
                if(Alp > 0 && Alp != 0){
                    collisionFound = true;
                    break; // Break the inner loop once a collision is found
                } else {
                    collisionFound = false;
                    break;
                }
            }
            if (collisionFound) { break; } // Break the outer loop as well
        }
    }

    // Return whether a collision was found
    return collisionFound;
}

SpriteWithCollision *currentSprite;

bool place_meeting(float x, float y, ObjectList *obj_list) {
    if (currentObject == NULL || obj_list == NULL) {
        return false; // No collision possible without valid input
    }

    SpriteWithCollision *currentSprite = &currentObject->collision_mask;

    // Calculate the current object's boundaries based on the given position
    float objLeft   = x + currentSprite->left - currentSprite->originX;
    float objRight  = x + currentSprite->right - currentSprite->originX;
    float objTop    = y + currentSprite->top - currentSprite->originY;
    float objBottom = y + currentSprite->bottom - currentSprite->originY;    

    // Iterate through the target object list
    for (int i = 0; i < obj_list->numObjects; ++i) {
        GameObject *otherObject = obj_list->objects[i];
        if (otherObject == NULL || otherObject == currentObject) {
            continue; // Skip null or self-collision
        }

        SpriteWithCollision *otherSprite = &otherObject->collision_mask;

        // Calculate the other object's boundaries
        float otherLeft     = otherObject->x + otherSprite->left - otherSprite->originX;
        float otherRight    = otherObject->x + otherSprite->right - otherSprite->originX;
        float otherTop      = otherObject->y + otherSprite->top - otherSprite->originY;
        float otherBottom   = otherObject->y + otherSprite->bottom - otherSprite->originY;

        bool isColliding = (objRight >= otherLeft && objLeft <= otherRight && objBottom >= otherTop && objTop <= otherBottom);

        // Handle collision types
        if (currentSprite->Type == RECTANGLE && otherSprite->Type == RECTANGLE) {
            if (isColliding){ return true; } // Simple bounding box collision
        }

        if (currentSprite->Type == RECTANGLE && otherSprite->Type == PRECISE){
                    // Determine RECTANGLE and PRECISE objects
            if(isColliding){

                if (CheckRectangleVsPrecise(objLeft, objTop, objRight, objBottom, obj_list)) {
                    return true;
                }

            } //else { break; }// else { break; }
        }
        if (currentSprite->Type == PRECISE && otherSprite->Type == RECTANGLE) {
            // Determine RECTANGLE and PRECISE objects
            if(isColliding){

                if (CheckRectangleVsPrecise(objLeft, objTop, objRight, objBottom, CurrObjLst)) {
                    return true;
                }

            }
        }

        if (currentSprite->Type == PRECISE && otherSprite->Type == PRECISE) {
            if (isColliding){ return true; } // Simple bounding box collision
        }

        //Descendant OBJ
        if (otherObject->descendant != NULL) {
            ObjectList *DESC = descObject.Descen;
                // Iterate through the target object list

            if (DESC->numObjects == 0) {
                free(DESC); // Free the list if empty
                otherObject->descendant = NULL;
            }

            for (int i = 0; i < DESC->numObjects; ++i) {
                GameObject *otherObject = DESC->objects[i];
                if (otherObject == NULL || otherObject == currentObject) {
                    continue; // Skip null or self-collision
                }

                SpriteWithCollision *otherSprite = &otherObject->collision_mask;

                // Calculate the other object's boundaries
                float otherLeft = otherObject->x + otherSprite->left - otherSprite->originX;
                float otherRight = otherObject->x + otherObject->width + otherSprite->right - otherSprite->originX;
                float otherTop = otherObject->y + otherSprite->top - otherSprite->originY;
                float otherBottom = otherObject->y + otherObject->height + otherSprite->bottom - otherSprite->originY;

                bool isColliding = (objRight >= otherLeft && objLeft <= otherRight && objBottom >= otherTop && objTop <= otherBottom);

                // Handle collision types
                if (currentSprite->Type == RECTANGLE && otherSprite->Type == RECTANGLE) {
                    if (isColliding){ return true; }
                }

                if (currentSprite->Type == RECTANGLE && otherSprite->Type == PRECISE){
                    // Determine RECTANGLE and PRECISE objects
                    if(isColliding){

                        if (CheckRectangleVsPrecise(objLeft, objTop, objRight, objBottom, DESC)) {
                            return true;
                        }

                    } //else { break; }// else { break; }
                }
                if (currentSprite->Type == PRECISE && otherSprite->Type == RECTANGLE) {
                    // Determine RECTANGLE and PRECISE objects
                    if(isColliding){

                        if (CheckRectangleVsPrecise(objLeft, objTop, objRight, objBottom, CurrObjLst)) {
                            return true;
                        }

                    } //else { break; }// else { break; }
                }
                if (currentSprite->Type == PRECISE && otherSprite->Type == PRECISE) {
                    if (isColliding){ return true; } // Simple bounding box collision
                }
            }
        }
    }

    return false; // No collision detected

}

bool move_and_collide(float *x, float *y, float dx, float dy, ObjectList *obj_list) {
    int steps = ceilf(sqrtf(dx * dx + dy * dy));
    float stepX = dx / steps;
    float stepY = dy / steps;
    bool collisionDetected = false;

    for (int i = 0; i < steps; i++) {
        // Move in X direction
        *x += stepX;

        // Check for collision at the new position (only X moved)
        if (place_meeting(*x, *y, obj_list)) {
            *x -= stepX; // Undo the X movement
            dx = 0;
            collisionDetected = true;
        }

        // Move in Y direction
        *y += stepY;

        // Check for collision at the new position (only Y moved)
        if (place_meeting(*x, *y, obj_list)) {
            *y -= stepY; // Undo the Y movement
            dy = 0;
            collisionDetected = true;
        }

        // If no further movement is possible, break out of the loop
        if (dx == 0 && dy == 0) {
            break;
        }
    }
    return collisionDetected;
}

//###############################################################################

int sign(float x) {
    if (x > 0) {
        return 1;
    } else if (x < 0) {
        return -1;
    } else {
        return 0;
    }
}

void room_goto(int selRoom) {
    // Perform any necessary cleanup before switching rooms
    RoomChanged = 0;

    if (RoomChanged == 0){
        room_background_cleanup();
        //MP3Player_Stop();
        //StopOgg();
        switch (selRoom) {
            case room_debug_select:
                rm_debug_select();  // Function to initialize Room 1
                break;
            case room_title:
                rm_title();  // Function to initialize Room 1
                break;
            case room_TEST0:
                TEST0();  // Function to initialize Room 0
                break;
            case room_testanim:
                rm_testanim();  // Function to initialize Room 2
                break;
            case room_testFMV:
                rm_testFMV();  // Function to initialize Room 2
                break;
            case room_TEST2:
                TEST2();  // Function to initialize Room 2
                break;
            case room_train1:
                rm_train1();
                break;
            case room_map1:
                rm_map1();
                break;
            case room_train2:
                rm_train2();
                break;
            // Add cases for additional rooms as needed
            
            default:
                // Handle invalid room identifier
                break;
        }
    }
    RoomChanged = 1;

    // Update the current room
    currentRoom = selRoom;
}

void room_goto_next() {
    // Perform any necessary cleanup before switching rooms
    selRoom++;

    room_background_cleanup();

    switch (selRoom) {
        case room_debug_select:
            rm_debug_select();  // Function to initialize Room 1
            break;
        case room_title:
            rm_title();  // Function to initialize Room 1
            break;
        case room_TEST0:
            TEST0();  // Function to initialize Room 0
            break;
        case room_testanim:
            rm_testanim();  // Function to initialize Room 2
            break;
        case room_testFMV:
            rm_testFMV();  // Function to initialize Room 2
            break;
        case room_TEST2:
            TEST2();  // Function to initialize Room 2
            break;
        case room_train1:
            rm_train1();
            break;
        case room_train2:
            rm_train2();
            break;
        // Add cases for additional rooms as needed
        
        default:
            // Handle invalid room identifier
            break;
    }
    RoomChanged = 1;
    
    // Update the current room
    currentRoom = selRoom;
}

// Function to read an OGG file from SD card and get its size
void audio_play_sound(const char* BGM, bool loop) {
    // Create a string to hold the file path
    char filepath[100]; // Adjust the size as needed
    sprintf(filepath, "cardb:/apps/SINGAL/data/BGM/%s.ogg", BGM);

    // Play the OGG file using PlayOgg
    int mode = loop ? OGG_INFINITE_TIME : OGG_ONE_TIME; // Assuming OGG_ONE_TIME is the loop flag
    PlayOggFile(filepath, 0, mode);
}

u32 current_color = GRRLIB_WHITE; // Default to white color

void draw_set_color(u32 color) {
    current_color = color; // Update the current drawing color
}

float current_alpha = 1.0f; // Default to fully opaque

void draw_set_alpha(float alpha) {
    current_alpha = clamp(alpha, 0.0f, 1.0f); // Clamp alpha between 0 and 1
}

void draw_rectangle(float x1, float y1, float x2, float y2, bool filled) {
    // Combine the current color with the alpha value
    u32 color_with_alpha = (u32)(current_alpha * 255) << 24 | (current_color & 0x00FFFFFF);

    // Draw the rectangle with the specified fill option
    if (filled) {
        GRRLIB_Rectangle(x1, y1, x2 - x1, y2 - y1, color_with_alpha, true);
    } else {
        GRRLIB_Rectangle(x1, y1, x2 - x1, y2 - y1, color_with_alpha, false);
    }
}

Camera view_camera[MAX_VIEWS];  // Initialize array of Camera structs

int RM_WIDTH, RM_HEIGHT;

void initialize_view_cameras() {
    for (int i = 0; i < MAX_VIEWS; i++) {
        view_camera[i].CamX = 0;
        view_camera[i].CamY = 0;
        view_camera[i].CamWidth = DEFAULT_CAMERA_WIDTH;
        view_camera[i].CamHeight = RM_HEIGHT;  // Default to room height, adjust as needed
    }
}

void camera_set_view_pos(int view_id, float x, float y) {
    if (view_id < 0 || view_id >= MAX_VIEWS) {
        return;  // Invalid view ID
    }
    
    view_camera[view_id].CamX = x;
    view_camera[view_id].CamY = y;

    // Ensure camera stays within room boundaries
    view_camera[view_id].CamX = clamp(view_camera[view_id].CamX, 0, RM_WIDTH - view_camera[view_id].CamWidth);
    view_camera[view_id].CamY = clamp(view_camera[view_id].CamY, 0, RM_HEIGHT - view_camera[view_id].CamHeight);
}
