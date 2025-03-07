#ifndef OBJ_WARP_H
#define OBJ_WARP_H

typedef struct {
    GameObject base; // Inherit from GameObject
    float newX;
    float newY;
    int newRoom;
} Warper;

extern Warper warp;

void obj_Warp_Step(int xPosition, int yPosition, int roomName);
void obj_WarpController_Step();
void obj_WarpController_Draw();

#endif // OBJ_WARP_H