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

#define JUMP_FORCE -22.5f

float x = 0;
float y = 0;
float grv = 1;
float hsp = 0;
float vsp = 0;
float spd = 5;
float pyrRunTime = 50;
float spdTimer = 50;
float sspStop = 10;
int jumpCount = 2;
bool canJump = false;
bool isJumping = false;
bool isCrouching = false;
bool isSliding = false;
bool slideEnded = true;
bool isBGGrab = false;
bool slopeOn = false;
bool onGround = false;
int slidingTimer = 0;
int slide_momentum = 0;
int image_xscale = 1;
int direction = 1;
const u8* sprite_index = TeoriIdletest;

//ObjectList obj_BGWall_list;
ObjectList obj_player2;

void obj_player2_Step() {

    GRRLIB_texImg *tex_teoriIdle = GRRLIB_LoadTexturePNG(sprite_index);

        // Allocate memory for a new object
    for (int i = 0; i < obj_player2.numObjects; ++i) {
        GameObject* currentObject = obj_player2.objects[i];
        if (currentObject != NULL) {
            // Update the player's object position
            currentObject->x = x;
            currentObject->y = y;
            currentObject->width = tex_teoriIdle->w / 5;
            currentObject->height = tex_teoriIdle->h / 5;
        }
    }

        scr_getInput();

        draw_objects(&obj_player2, tex_teoriIdle);

        bool WallSlide = place_meeting(x - 1, y, tex_teoriIdle->w , tex_teoriIdle->h, &obj_solid_list) || place_meeting(x + 1, y, tex_teoriIdle->w , tex_teoriIdle->h, &obj_solid_list);

        // Are we on the ground?
        bool onGround = place_meeting(x, y + 1, tex_teoriIdle->w, tex_teoriIdle->h, &obj_solid_list);

        bool _hCol = move_and_collide(&x, &y, tex_teoriIdle->w, tex_teoriIdle->h, hsp, 0, &obj_solid_list);

        bool _vCol = move_and_collide(&x, &y, tex_teoriIdle->w, tex_teoriIdle->h, 0, vsp, &obj_solid_list);

        //bool _hCol = move_and_collide(&x, &y, tex_teoriIdle->w, tex_teoriIdle->h, hsp, 0, &obj_solid_list);
	
		if (WallSlide) {
		    if (vsp > 1) {
		        vsp = 3;
		        if (key.jump2) {
		            vsp = JUMP_FORCE * 1.07;
		            hsp -= 15.0 * image_xscale;
		        }
		    }
		}

        if (_hCol) {
            isJumping = false; // Reset jump ability when on the ground
            hsp = 0; // Stop horizontal movement
        }

        // Walk down slope
        if (onGround && slopeOn && place_meeting(x, y + abs(hsp) + 1, tex_teoriIdle->w, tex_teoriIdle->h, &obj_solid_list) && vsp >= 0) {
            jumpCount = 2; // Reset jump count when player lands
            isJumping = false;
            vsp += abs(hsp) + 1;
        }

        if (_vCol && vsp > 0) {
            jumpCount = 2; // Reset jump count when player lands
            isJumping = false;
            vsp = 0;
        }

        vsp += grv;

        // Update player logic (input handling, movement, collisions, etc.)
        // Move left
        if (key.left2) {
            direction = 0; // Update direction when moving left
        } else if (key.right2) {
            direction = 1; // Update direction when moving right
        }

        hsp = (key.right2 - key.left2) * spd;

        if (key.crouch2)
        {
            isCrouching = true;
        }
        else
        {
            isCrouching = false;
        }

        if (key.run2) {
            if (sspStop > 0) {
                if (spdTimer <= 0) {
                    spd = 12;
                } else {
                    spd = 10;
                    if (hsp != 0) {
                        spdTimer--;
                    }
                }
                if ((hsp == 0) && (vsp == 0)) {
                    spdTimer = pyrRunTime;
                    spd = 10;
                }
            }
        } else {
            sspStop--;
            if (sspStop <= 0) {
                spd = 8;
                spdTimer = pyrRunTime;
                sspStop = 10;
            }
        }

        if (isCrouching == true && key.run2 && vsp == 0)
        {
            isSliding = true;
        }
        else
        {
            isSliding = false;
        }
        
        if (isSliding && slideEnded == false)
        {
            if (slidingTimer <= 50)  // Assuming 60 frames per second, 240 frames = 4 seconds
            {
                slide_momentum = 2; // You can adjust this value to control the momentum
                slidingTimer++;

                // Apply momentum based on the direction of the slide
                if (hsp == 0) {
                    if (direction == 1)
                    {
                        hsp += sign(hsp + 1);
                    }
                    else
                    {
                        hsp += sign(hsp - 1);
                    }
                }
                hsp += sign(hsp) * 15; // Add momentum
            }
            else
            {
                slidingTimer = 0;
                slide_momentum = 0;
                hsp = 0;  // Stop sliding by setting horizontal speed to 0
                slideEnded = true;
            }
        }

        if (slideEnded)
        {
            slide_momentum = 0;
            isSliding = false;
        }

        // Reset slideEnded if crouching is false
        if (isCrouching == false && slideEnded == true)
        {
            slideEnded = false;
        }

        if (key.jump2 && jumpCount > 0)
	    {
			if (isBGGrab == true)
			{
				vsp = (JUMP_FORCE * 1.1);
			}
	        else if (spd >= 10)
	        {
	            vsp = (JUMP_FORCE * 1.07);
	        }
	        else if (spd >= 7)
	        {
	            vsp = (JUMP_FORCE * 1.05);
	        }
	        else
	        {
	            vsp = JUMP_FORCE;
	        }
		
		    jumpCount--; // Decrease jump count
    
		    isJumping = true;
	    }

        if (isBGGrab == false)
        {
            if (place_meeting(x, y, tex_teoriIdle->w, tex_teoriIdle->h, &obj_BGWall_list))
            {
                if (key.crouch2)
                {
                    isBGGrab = true;
                }
            }
        }
        else
        {
            isJumping = false;
            
            if (isJumping == false && isBGGrab == true)
            {
                grv = 0;
                grv += 0.2;
                spd = 15;
            }
        }

        if (!place_meeting(x, y, tex_teoriIdle->w, tex_teoriIdle->h, &obj_BGWall_list))
        {
            isBGGrab = false;
            grv = 1;
        }

        if (!isJumping) {
            canJump = true;
        }

        if (hsp != 0){
            image_xscale = sign(hsp);
        }

        //Animation
        if ((place_meeting(x, y + 1, tex_teoriIdle->w, tex_teoriIdle->h, &obj_solid_list))== false)
        {	
            if (jumpCount >= 1)
			{
				sprite_index = teoriJump;
				if (sign(vsp) > 0)
                {
                    sprite_index = teoriFall; 
                }
                else 
                {
                    sprite_index = teoriJump;
                }
				/*^ Also could use image index = 1 (jump frame) or 2 (falling frame) if the
				falling sprite is in the same sprite as jump. */
			}
			else
			{
				sprite_index = teoriDoubleJump;
				/*^ Also could use image index = 1 (jump frame) or 2 (falling frame) if the
				falling sprite is in the same sprite as jump. */
			}	
        }
        else
        {
            //obj_player.image_speed = 1;
            if (hsp == 0 && vsp == 0)
            {
                sprite_index = TeoriIdletest;
            }
            else
            {
                sprite_index = TeoriWalktest;
            }
        }

        if (spd == 10 && isJumping == false && isSliding == false)
        {
            sprite_index = TeoriRun1;
        }
        else if (spd == 12 && isJumping == false && isSliding == false)
        {
            sprite_index = TeoriRun2;
        }
        
        if (isCrouching == true)
        {
            sprite_index = teoriCrouch;
        }
        
        if (isSliding == true)
        {
            sprite_index = teoriSlide;
        }

    //DEBUG POS

    GRRLIB_ttfFont *myFont = GRRLIB_LoadTTF(fot_ttf, fot_ttf_size); // Debug Font

    char playerPos[50]; // Create a buffer to hold the text

    char playerJumpState[50];

    // Format the player position into a string
    snprintf(playerPos, sizeof(playerPos), "playerX: %.2f, playerY: %.2f", x, y);

    snprintf(playerJumpState, sizeof(playerJumpState), "isJumping: %s", isJumping ? "true" : "false");

    GRRLIB_PrintfTTF(20, 20, myFont, playerPos, 14, GRRLIB_WHITE);
    GRRLIB_PrintfTTF(20, 40, myFont, playerJumpState, 14, GRRLIB_WHITE);

    GRRLIB_FreeTexture(tex_teoriIdle);
    GRRLIB_FreeTTF(myFont); // Free the loaded TTF font when done
}