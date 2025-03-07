#ifndef OBJ_PLAYER_H
#define OBJ_PLAYER_H

//Create

extern float x, y, grv, hsp, vsp, spd, pyrRunTime, spdTimer, sspStop, dashSpd, fricc;
extern int jumpCount, slidingTimer, slide_momentum, image_xscale, direction, xscale, maxDashSpd, maxSpd, accel;
extern bool canJump, isJumping, isCrouching, isSliding, slideEnded, isBGGrab, slopeOn, onGround;
extern SpriteWithCollision sprite_index;


#endif // OBJ_PLAYER_H