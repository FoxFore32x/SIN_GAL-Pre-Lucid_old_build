#ifndef INPUT_H
#define INPUT_H

typedef struct {
    bool left;
    bool left2;
    bool right;
    bool right2;
    bool up;
    bool up2;
    bool down;
    bool down2;
    bool jump;
    bool jump2;
    bool jump3;
    bool run;
    bool run2;
    bool run3;
    bool crouch;
    bool crouch2;
    bool crouch3;
    bool start;
    bool start2;
    bool start3;
    bool debug_stage_select;
    bool debug_stage_select2;
    bool debug_stage_select3;
    bool exit;
    bool exit2;
    bool exit3;
    bool stickpressed;

} InputList;

extern InputList key;

void scr_getInput();

#endif