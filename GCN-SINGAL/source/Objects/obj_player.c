#include <grrlib.h>
#include <ogc/video.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>
//#include <wiiuse/wpad.h>
#include <stdio.h>
#include <asndlib.h>
#include <gctypes.h>
#include <gccore.h>

#include "../Sprites/Sprites.h"
#include "../Scripts/Scripts.h"
#include "../Rooms/room.h"
#include "objects.h"
#include "../Extensions/Extensions.h"

SpriteWithCollision sprite_index;
ObjectList obj_player2;
ObjectList obj_solid;
GameObject *currentObject = NULL;
GRRLIB_ttfFont *myFont;
float x = 0, 
y = 0, 
grv = 1, 
hsp = 0, 
vsp = 0, 
spd = 8, 
pyrRunTime = 50, 
spdTimer = 50, 
sspStop = 10, 
dashSpd = 0, 
fricc = 0.8;

int jumpCount = 2, 
slidingTimer = 0, 
slide_momentum = 0, 
image_xscale = 1, 
direction = 1, 
xscale = 1, 
maxDashSpd = 0, 
maxSpd = 10, 
accel = 5,
coyoteHangFrames = 3,
coyoteHangTimer = 0,
coyoteJumpFrames = 5,
coyoteJumpTimer = 0,
maxVel = 20,
jumpHoldTimer = 0,
jumpMax = 2;

int jumpHoldFrames[2] = {18, 10}; // Declare and initialize the array

float JUMP_FORCE[3] = {-18.5, -13.5, -25.5};

bool canJump = false, 
isJumping = false, 
isCrouching = false, 
isSliding = false, 
slideEnded = true, 
isBGGrab = false, 
slopeOn = false, 
onGround = false;

bool setOnGround(bool _val){
    if (_val == true){
        onGround = true;
        coyoteHangTimer = coyoteHangFrames;
    } else {
        onGround = false;
        coyoteHangTimer = 0;
    }
    return _val;
}

void obj_player_Step() {

//============== NO TOUCHIE, GRRLIB SYSTEM CODE! ================================================================================================

    // Allocate memory for a new object
    for (int i = 0; i < obj_player2.numObjects; ++i) {
        currentObject = obj_player2.objects[i];
        if (currentObject != NULL) {
            // Update the player's object position
            float InitX = currentObject->x;
            float InitY = currentObject->y;

            if (x == 0 && y == 0)
            {
                x = InitX;
                y = InitY;
            }

            currentObject->x = x;
            currentObject->y = y;
            //=================================================================================================================================

            scr_getInput();

            bool WallSlide = place_meeting(x - 1, y, &obj_solid) || place_meeting(x + 1, y, &obj_solid);

            float _subPixel = .5;
        
            if (WallSlide) {
                if (vsp > 1) {
                    vsp = 3;
                    if (key_jump) {
                        vsp = JUMP_FORCE[2];
                        hsp -= 15.0 * image_xscale;
                    }
                }
            }

            hsp = (key_right2 - key_left2) * spd;

            // Update player logic (input handling, movement, collisions, etc.)
            // Move left
            if (key_left2) {
                direction = 0; // Update direction when moving left
            } else if (key_right2) {
                direction = 1; // Update direction when moving right
            }

            //Colisiones Horizontales

            if (place_meeting(x+hsp,y, &obj_solid))
            {
                float _pixelCheckH = _subPixel * sign(hsp);
                while (!place_meeting(x + _pixelCheckH, y, &obj_solid)){
                    x += _pixelCheckH;
                }
                hsp = 0;
                isJumping = false; // Reset jump ability when on the ground
            }

            x += hsp;

            if (coyoteHangTimer > 0){
                coyoteHangTimer--;
            } else {
                vsp += grv;
                setOnGround(false);
            }

            if (vsp > maxVel) {vsp = maxVel; };

            //reset jumping variables.
            if (onGround){
                jumpCount = 0;
                jumpHoldTimer = 0;
                coyoteJumpTimer = coyoteJumpFrames;
            } else{
                //No extra jumps
                coyoteJumpTimer--;
                if (jumpCount == 0 && coyoteJumpTimer <= 0) { jumpCount = 1; };
            }

            //Colisiones Verticales

            if (place_meeting(x,y+vsp, &obj_solid))
            {
                float _pixelCheckV = _subPixel * sign(vsp);

                while (!place_meeting(x,y+_pixelCheckV, &obj_solid))
                {
                    y += _pixelCheckV;
                }

                if (vsp < 0){
                    jumpHoldTimer = 0;
                }
                vsp = 0;
                isJumping = false;
            }

            if (vsp >= 0 && place_meeting(x, y+1, &obj_solid)){
                setOnGround(true);
            }

            y += vsp;


            if (key_crouch2 && place_meeting(x, y + 1, &obj_solid))
            {
                isCrouching = true;
            }
            else
            {
                isCrouching = false;
            }

           	if (jumpKeyBuffered && jumpCount < jumpMax)
            {
                
                jumpKeyBuffered = false;
                jumpKeyBufferTimer = 0;
                
                //increase the number of performed jumps
                jumpCount++;
            
                //Set the Jump Hold Timer
                jumpHoldTimer = jumpHoldFrames[jumpCount-1];
                
                setOnGround(false);
            
                isJumping = true;
            }
            
            if (!key_jump2){
                jumpHoldTimer = 0;
            }

            if (jumpHoldTimer > 0){
                //vsp be jump speed
                vsp = JUMP_FORCE[jumpCount-1];
                jumpHoldTimer--;
            }

            if (key_up2) {
                vsp = -spd;
            } else if (key_down2) {
                vsp = spd;
            }

            if (key_run2) {
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

            if (isCrouching == true && key_run2)
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

            if (isBGGrab == false)
            {
                if (place_meeting(x, y, &obj_BGWall))
                {
                    if (key_crouch2)
                    {
                        jumpCount = 1; // Reset jump count when player lands
                        isBGGrab = true;
                    }
                }
            }
            else
            {
                isJumping = false;
                maxVel = 4;
                spd = 15;
                jumpCount = 1;

                if (isJumping == true)
                {
                    maxVel = 40;
                }
            }

            if (!place_meeting(x, y, &obj_BGWall))
            {
                isBGGrab = false;
                maxVel = 20;
            }

            if (hsp != 0){
                image_xscale = sign(hsp);
            }
            if (key_test)
            {
                instance_create(&obj_solid, 20, 20, 2, 2, &spr_solid, LAYER_SOLID, false, NULL);
            }
            //Animation
            if (!place_meeting(x, y + 1, &obj_solid))
            {	
                if (jumpCount <= 1)
                {
                    //sprite_index = teoriJump;
                    sprite_index = spr_teoriJump;
                    if (sign(vsp) > 0)
                    {
                        //sprite_index = teoriFall;
                        sprite_index = spr_teoriFall;
                    }
                    else 
                    {
                        //sprite_index = teoriJump;
                        sprite_index = spr_teoriJump;
                    }
                    /*^ Also could use image index = 1 (jump frame) or 2 (falling frame) if the
                    falling sprite is in the same sprite as jump. */
                }
                else
                {
                    //sprite_index = teoriDoubleJump;
                    sprite_index = spr_teoriDoubleJump;
                    /*^ Also could use image index = 1 (jump frame) or 2 (falling frame) if the
                    falling sprite is in the same sprite as jump. */
                }	
            }
            else
            {
                //obj_player.image_speed = 1;
                if (hsp == 0)
                {
                    //sprite_index = TeoriIdletest;
                    sprite_index = spr_teoriIdle;
                }
                else
                {
                    //sprite_index = TeoriWalktest;
                    sprite_index = spr_teoriWalk;
                }
            }

            if (spd == 10 && isJumping == false && isSliding == false)
            {
                //sprite_index = TeoriRun1;
                sprite_index = spr_teoriRun1;
            }
            else if (spd == 12 && isJumping == false && isSliding == false)
            {
                //sprite_index = TeoriRun2;
                sprite_index = spr_teoriRun2;
            }
            
            if (isCrouching == true)
            {
                //sprite_index = teoriCrouch;
                sprite_index = spr_teoriCrouch;
            }
            
            if (isSliding == true)
            {
                //sprite_index = teoriSlide;
                sprite_index = spr_teoriSlide;
            }
        }
    }
}

void obj_player_Draw()
{
    //#################### SPRITE INIT ###################################################################

    if(myFont == NULL){
        myFont = GRRLIB_LoadTTF(fot_ttf, fot_ttf_size); // Debug Font
    }

    CalculateFPS();
    //DrawFPS(myFont);

    /*char playerPos[50]; // Create a buffer to hold the text

    //char playerJumpState[50];

    // Format the player position into a string
    snprintf(playerPos, sizeof(playerPos), "playerX: %.2f, playerY: %.2f", x, y);

    //snprintf(playerJumpState, sizeof(playerJumpState), "isJumping: %s", isJumping ? "true" : "false");

    GRRLIB_PrintfTTF(20, 20, myFont, playerPos, 14, GRRLIB_WHITE);
    //GRRLIB_PrintfTTF(20, 40, myFont, playerJumpState, 14, GRRLIB_WHITE);

    GRRLIB_FreeTTF(myFont); // Free the loaded TTF font when done*/

    //show_hud();

    currentObject->collision_mask = sprite_index;

    draw_objects(&obj_player2, &currentObject->collision_mask, image_xscale, 1);
}