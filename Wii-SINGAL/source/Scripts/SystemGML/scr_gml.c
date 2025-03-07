#include <grrlib.h>
#include <ogc/video.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>
#include <wiiuse/wpad.h>
#include <mp3player.h>
#include <stdio.h>
#include <asndlib.h>
#include <gctypes.h>
#include <gccore.h>

#include "scr_gml.h"
#include "../../Rooms/room.h"
#include "../../Objects/objects.h"
#include "../../Sprites/Sprites.h"
#include "../Video/scr_video.h"

int currentRoom;

// Function to initialize objects
void obj_init(ObjectList *obj_list) {
    obj_list->numObjects = 0;
    for (int i = 0; i < MAX_OBJECTS; ++i) {
        obj_list->objects[i] = NULL;
    }
}

// Function to add objects
void obj_add(ObjectList *obj_list, float x, float y, float width, float height) {

    if (obj_list->numObjects < MAX_OBJECTS) {
        GameObject* newObject = (GameObject*)malloc(sizeof(GameObject));
        if (newObject != NULL) {
            newObject->x = x;
            newObject->y = y;
            newObject->width = width;
            newObject->height = height;
            obj_list->objects[obj_list->numObjects++] = newObject;
        }
    }
}

void draw_objects(ObjectList *obj_list, GRRLIB_texImg *texture) {

    for (int i = 0; i < obj_list->numObjects; ++i) {
        GameObject* currentObject = obj_list->objects[i];
        if (currentObject != NULL) {
            // Draw the object using its position and dimensions
            // Adjust rendering positions based on camera position and aspect ratio
            // Assuming obj_game_camera is the camera structure defined elsewhere in your code

            float screenX = (currentObject->x - obj_game_camera.CamX);
            float screenY = (currentObject->y - obj_game_camera.CamY);

            // Scale the object's dimensions based on the aspect ratio
            float objectWidth = currentObject->width;
            float objectHeight = currentObject->height;


            // Draw the sprite using the calculated coordinates and dimensions
            GRRLIB_DrawImg(screenX, screenY, texture, 0, objectWidth / 32, objectHeight / 32, GRRLIB_WHITE);
        }
    }
}


// Function to free memory for objects
void obj_cleanup(ObjectList *obj_list) {
    for (int i = 0; i < obj_list->numObjects; ++i) {
        free(obj_list->objects[i]);
    }
    obj_list->numObjects = 0;
}

// Function to check collisions for a specific object
bool place_meeting(float x, float y, float width, float height, ObjectList *obj_list) {
    // Iterate over the objects in the object list
    for (int i = 0; i < obj_list->numObjects; ++i) {
        GameObject* currentObject = obj_list->objects[i];
        if (currentObject != NULL) {
            // Check if the bounding boxes of the two objects intersect
            if (x < currentObject->x + currentObject->width &&
                x + width > currentObject->x &&
                y < currentObject->y + currentObject->height &&
                y + height > currentObject->y) {
                // Bounding boxes intersect, indicating a collision
                return true;
            }
        }
    }
    // No collision detected
    return false;
}

bool move_and_collide(float *x, float *y, float width, float height, float dx, float dy, ObjectList *obj_list) {
    // Save the original position
    float origX = *x;
    float origY = *y;

    // Calculate the distance to move in each iteration
    float stepX = dx / 4.0f; // Dividing into 4 steps as in GameMaker
    float stepY = dy / 4.0f;

    // Iterate through each step
    for (int i = 0; i < 4; i++) {
        // Attempt to move horizontally
        *x += stepX;
        if (place_meeting(*x, *y, width, height, obj_list)) {
            // Horizontal collision detected, move back to original position
            *x = origX;
        }

        // Attempt to move vertically
        *y += stepY;
        if (place_meeting(*x, *y, width, height, obj_list)) {
            // Vertical collision detected, move back to original position
            *y = origY;
        }
    }

    // Return true if no collisions detected, false otherwise
    return (*x == origX && *y == origY);
}


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
    room_background_cleanup();
    MP3Player_Stop();

    switch (selRoom) {
        case room_debug_select:
            rm_debug_select();  // Function to initialize Room 1
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
        // Add cases for additional rooms as needed
        
        default:
            // Handle invalid room identifier
            break;
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
        // Add cases for additional rooms as needed
        
        default:
            // Handle invalid room identifier
            break;
    }
    RoomChanged = 1;
    
    // Update the current room
    currentRoom = selRoom;
}