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

#include "../Sprites/Sprites.h"
#include "../Scripts/SystemGML/scr_gml.h"
#include "../Rooms/room.h"
#include "fot_ttf.h"
#include "objects.h"
#include "../Scripts/Input/input.h"

//THIS PLAYER CODE IS OBSOLETE

#define JUMP_FORCE -15.0f

obj_player_Vars obj_player;
ObjectList obj_solid_list;
//ObjectList obj_BGWall_list;
Camera obj_game_camera;
InputList key;

/*void loadTextures() {
    // Load textures into the array
    spr_player[0] = GRRLIB_LoadTextureFromFile("sd:/apps/SINGAL/data/Sprites/Player/TeoriIdle.png");
    spr_player[1] = GRRLIB_LoadTextureFromFile("sd:/apps/SINGAL/data/Sprites/Player/TeoriWalk.png");
    spr_player[2] = GRRLIB_LoadTextureFromFile("sd:/apps/SINGAL/data/Sprites/Player/TeoriRun1.png");
    spr_player[3] = GRRLIB_LoadTextureFromFile("sd:/apps/SINGAL/data/Sprites/Player/TeoriRun2.png");
    spr_player[4] = GRRLIB_LoadTextureFromFile("sd:/apps/SINGAL/data/Sprites/Player/teoriJump.png");
    spr_player[5] = GRRLIB_LoadTextureFromFile("sd:/apps/SINGAL/data/Sprites/Player/teoriFall.png");
    spr_player[6] = GRRLIB_LoadTextureFromFile("sd:/apps/SINGAL/data/Sprites/Player/teoriCrouch.png");
    spr_player[7] = GRRLIB_LoadTextureFromFile("sd:/apps/SINGAL/data/Sprites/Player/teoriSlide.png");
    // Add more textures as needed...
}*/

void obj_player_Create(float XPos, float YPos) {
    obj_player.x = XPos;
    obj_player.y = YPos;
    obj_player.grv = 1;
    obj_player.hsp = 0;
    obj_player.vsp = 0;
    obj_player.spd = 5;
    obj_player.pyrRunTime = 50;
    obj_player.spdTimer = 50;
    obj_player.sspStop = 10;
    obj_player.jumpCnt = 2;
    obj_player.canJump = false;
    obj_player.isJumping = false;
    obj_player.isCrouching = false;
    obj_player.isSliding = false;
    obj_player.slideEnded = true;
    obj_player.isBGGrab = false;
    obj_player.slidingTimer = 0;
    obj_player.slide_momentum = 0;
    obj_player.image_xscale = 1;
    obj_player.sprite_index = TeoriIdletest;
    obj_player.direction = 1;
}

void obj_player_Step() {

    scr_getInput();

    GRRLIB_texImg *tex_teoriIdle = GRRLIB_LoadTexturePNG(obj_player.sprite_index);

    // Update player logic (input handling, movement, collisions, etc.)
    // Move left
    if (key.left2) {
        obj_player.hsp = -obj_player.spd;
        obj_player.direction = 0; // Update direction when moving left
    } else if (key.right2) {
        obj_player.hsp = obj_player.spd;
    obj_player.direction = 1; // Update direction when moving right
    } else {
        obj_player.hsp = 0;
    }

    if (key.crouch2)
	{
		obj_player.isCrouching = true;
	}
	else
	{
		obj_player.isCrouching = false;
	}

    if (key.run2) {
        if (obj_player.sspStop > 0) {
            if (obj_player.spdTimer <= 0) {
                obj_player.spd = 10;
            } else {
                obj_player.spd = 7;
                if (obj_player.hsp != 0) {
                    obj_player.spdTimer--;
                }
            }
            if ((obj_player.hsp == 0) && (obj_player.vsp == 0)) {
                obj_player.spdTimer = obj_player.pyrRunTime;
                obj_player.spd = 7;
            }
        }
    } else {
        obj_player.sspStop--;
        if (obj_player.sspStop <= 0) {
            obj_player.spd = 5;
            obj_player.spdTimer = obj_player.pyrRunTime;
            obj_player.sspStop = 10;
        }
    }

    if (obj_player.isCrouching == true && key.run2 && obj_player.vsp == 0)
	{
		obj_player.isSliding = true;
	}
	else
	{
		obj_player.isSliding = false;
	}
	
	if (obj_player.isSliding && obj_player.slideEnded == false)
	{
	    if (obj_player.slidingTimer <= 50)  // Assuming 60 frames per second, 240 frames = 4 seconds
	    {
	        obj_player.slide_momentum = 2; // You can adjust this value to control the momentum
	        obj_player.slidingTimer++;

			// Apply momentum based on the direction of the slide
	        if (obj_player.hsp == 0) {
	            if (obj_player.direction == 1)
				{
					obj_player.hsp += sign(obj_player.hsp + 1);
				}
				else
				{
					obj_player.hsp += sign(obj_player.hsp - 1);
				}
	        }
	        obj_player.hsp += sign(obj_player.hsp) * 15; // Add momentum
	    }
	    else
	    {
	        obj_player.slidingTimer = 0;
	        obj_player.slide_momentum = 0;
	        obj_player.hsp = 0;  // Stop sliding by setting horizontal speed to 0
	        obj_player.slideEnded = true;
	    }
	}

	if (obj_player.slideEnded)
	{
	    obj_player.slide_momentum = 0;
	    obj_player.isSliding = false;
	}

	// Reset slideEnded if crouching is false
	if (obj_player.isCrouching == false && obj_player.slideEnded == true)
	{
	    obj_player.slideEnded = false;
	}

    if (obj_player.isBGGrab == false)
    {
        if (place_meeting(obj_player.x, obj_player.y, 
        tex_teoriIdle->w, tex_teoriIdle->h, &obj_BGWall_list))
        {
            if (key.crouch2)
            {
                obj_player.isBGGrab = true;
            }
        }
	}
    else
	{
		obj_player.isJumping = false;
		
		if (obj_player.isJumping == false)
		{
			obj_player.grv = 0;
            obj_player.grv += 0.2;
            obj_player.spd = 15;
		}
	}

    if (!place_meeting(obj_player.x, obj_player.y, 
    tex_teoriIdle->w, tex_teoriIdle->h, &obj_BGWall_list))
    {
        obj_player.isBGGrab = false;
        obj_player.grv = 1;
    }

    /*if (!place_meeting(obj_player.x, obj_player.y, 
    tex_teoriIdle->w, tex_teoriIdle->h, &obj_BGWall_list))
    {
        obj_player.grv = 1.5;
    }*/

    obj_player.vsp += obj_player.grv;

    if (place_meeting(obj_player.x + obj_player.hsp, obj_player.y, tex_teoriIdle->w, tex_teoriIdle->h, &obj_solid_list)) {
        // Handle horizontal collision
        obj_player.isJumping = false;
        if (obj_player.hsp != 0) {
            while (!place_meeting(obj_player.x + obj_player.hsp, obj_player.y, tex_teoriIdle->w, tex_teoriIdle->h, &obj_solid_list)){
                obj_player.x += sign(obj_player.hsp);
            }
            obj_player.hsp = 0;
            obj_player.canJump = true; // Reset jump ability when on the ground
        }
    }

    // Apply horizontal movement
    obj_player.x += obj_player.hsp;

    if (place_meeting(obj_player.x, obj_player.y + obj_player.vsp, tex_teoriIdle->w, tex_teoriIdle->h, &obj_solid_list)) {
        // Handle horizontal collision
        obj_player.isJumping = false;
        if (obj_player.vsp != 0) {
            while (!place_meeting(obj_player.x, obj_player.y + obj_player.vsp, tex_teoriIdle->w, tex_teoriIdle->h, &obj_solid_list)){
                obj_player.y += sign(obj_player.vsp);
            }
            obj_player.vsp = 0;
            obj_player.canJump = true; // Reset jump ability when on the ground
        }
    }

    // Apply vertical movement
    obj_player.y += obj_player.vsp;

    if (!obj_player.isJumping) {
    obj_player.canJump = true;
    }

        // Check for jump input and apply vertical speed
    if ((key.jump2) && !obj_player.isJumping && obj_player.canJump) {
        if (obj_player.spd >= 10) {
            obj_player.vsp = (JUMP_FORCE * 1.5);
        } else if (obj_player.spd >= 7) {
            obj_player.vsp = (JUMP_FORCE * 1.22);
        } else {
            obj_player.vsp = JUMP_FORCE;
        }
        obj_player.isJumping = true;
    }

    // Horizontal boundary check
    if (obj_player.x < 0) {
        obj_player.x = 0;
    } else if (obj_player.x > ROOM_WIDTH - tex_teoriIdle->w) {
        obj_player.x = ROOM_WIDTH - tex_teoriIdle->w;
    }

    // Vertical boundary check
    if (obj_player.y < 0) {
        obj_player.y = 0;
        obj_player.isJumping = false;
    } else if (obj_player.y > ROOM_HEIGHT - tex_teoriIdle->h) {
        obj_player.y = ROOM_HEIGHT - tex_teoriIdle->h;
        obj_player.isJumping = false;
    }

    GRRLIB_ttfFont *myFont = GRRLIB_LoadTTF(fot_ttf, fot_ttf_size); // Debug Font

    // Calculate the position of the Teori sprite relative to the camera
    float teoriX = obj_player.x - obj_game_camera.CamX;
    float teoriY = obj_player.y - obj_game_camera.CamY;

    // Calculate the scaling factor based on the current camera width
    float camWidthFactor = obj_game_camera.CamWidth / DEFAULT_CAMERA_WIDTH;

    // Calculate the scaled sprite width
    float scaledSpriteWidth = tex_teoriIdle->w * camWidthFactor;

    // Calculate the X position based on Teori's direction
    int drawX = (obj_player.direction == 1) ? teoriX : teoriX + tex_teoriIdle->w;

    // Draw Teori sprite
    GRRLIB_DrawImg(drawX, teoriY, tex_teoriIdle, 0, obj_player.image_xscale * (obj_game_camera.CamWidth / (scaledSpriteWidth * 10)), 1, GRRLIB_WHITE);

    if (obj_player.hsp != 0){
        obj_player.image_xscale = sign(obj_player.hsp);
    }

    //DEBUG POS
    char playerPos[50]; // Create a buffer to hold the text

    char playerJumpState[50];

    // Format the player position into a string
    snprintf(playerPos, sizeof(playerPos), "playerX: %.2f, playerY: %.2f", obj_player.x, obj_player.y);

    snprintf(playerJumpState, sizeof(playerJumpState), "isJumping: %s", obj_player.isJumping ? "true" : "false");

    GRRLIB_PrintfTTF(20, 20, myFont, playerPos, 14, GRRLIB_WHITE);
    GRRLIB_PrintfTTF(20, 40, myFont, playerJumpState, 14, GRRLIB_WHITE);

    //Animation
    if ((place_meeting(obj_player.x, obj_player.y + 1, tex_teoriIdle->w, tex_teoriIdle->h, &obj_solid_list))== false)
    {
        obj_player.sprite_index = teoriJump;
        //image_speed = 0; ported over from Game Maker lmao
        if(sign(obj_player.vsp) > 0)
        {
            obj_player.sprite_index = teoriFall;
        }
        else
        {
            obj_player.sprite_index = teoriJump;
        }
        /*^ Also could use image index = 1 (jump frame) or 2 (falling frame) if the
        falling sprite is in the same sprite as jump. */	
    }
    else
    {
        //obj_player.image_speed = 1;
        if (obj_player.hsp == 0 && obj_player.vsp == 0)
        {
            obj_player.sprite_index = TeoriIdletest;
        }
        else
        {
            obj_player.sprite_index = TeoriWalktest;
        }
    }

    if (obj_player.spd == 7 && obj_player.isJumping == false)
    {
		obj_player.sprite_index = TeoriRun1;
    }
    else if (obj_player.spd == 10 && obj_player.isJumping == false)
    {
		obj_player.sprite_index = TeoriRun2;
    }
	
	if (obj_player.isCrouching == true)
	{
		obj_player.sprite_index = teoriCrouch;
	}
	
	if (obj_player.isSliding == true)
	{
		obj_player.sprite_index = teoriSlide;
	}
    GRRLIB_FreeTexture(tex_teoriIdle);
    GRRLIB_FreeTTF(myFont); // Free the loaded TTF font when done
}
