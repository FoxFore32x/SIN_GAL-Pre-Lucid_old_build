// scr_gml.h
#ifndef SCR_GML_H
#define SCR_GML_H

#include "../../Objects/objects.h"

#define SCREEN_WIDTH 640
#define SCREEN_HEIGHT 480

//bool place_meeting(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2);
void obj_init(ObjectList *obj_list);
void obj_add(ObjectList *obj_list, float x, float y, float width, float height);
void draw_objects(ObjectList *obj_list, GRRLIB_texImg *texture);
void obj_cleanup(ObjectList *obj_list);
bool place_meeting(float x1, float y1, float w1, float h1, ObjectList* objList);
bool move_and_collide(float *x, float *y, float width, float height, float dx, float dy, ObjectList *obj_list);
int sign(float x);
void room_goto(int selRoom);
void room_goto_next();

#endif // SCR_GML_H