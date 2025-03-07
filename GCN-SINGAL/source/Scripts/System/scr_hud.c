#include <stdio.h>
#include "scr_System.h"

void show_hud(){
    draw_sprite(spr_StateBar, 0, (0 + view_camera[0].CamX), (352 + view_camera[0].CamY));
    draw_sprite(spr_TeoriState, 0, (0 + view_camera[0].CamX), (352 + view_camera[0].CamY));
}