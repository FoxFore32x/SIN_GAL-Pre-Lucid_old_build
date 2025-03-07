#include <grrlib.h>
#include <ogc/video.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>
//#include <wiiuse/wpad.h>
#include <mp3player.h>
#include <stdio.h>
#include <asndlib.h>
#include <gctypes.h>
#include <gccore.h>
#include <fat.h>
#include <sdcard/gcsd.h>
#include "Extensions/oggplayer.h"

#include "Sprites/Sprites.h"
#include "Scripts/Scripts.h"
#include "Rooms/room.h"
#include "Objects/objects.h"
#include "Extensions/Extensions.h"

int main(int argc, char *argv[]) {
    // Initialization code for GRRLIB, WPAD, etc.
    GRRLIB_Init();
    //WPAD_Init();
    PAD_Init();
    ASND_Init();
    //MP3Player_Init();
    InitVideo();

    //fatMountSimple("sd:/", &__io_gcsda);

    int popo = 0;

    GRRLIB_Settings.antialias = false;

    GRRLIB_2dMode();

    PlayOgg(sfx_fart_ogg, sfx_fart_ogg_size, 0, OGG_ONE_TIME);

    GRRLIB_texImg* intro = GRRLIB_LoadTexturePNG(tex_feltree);

    // Game loop
    while (1) {

        GRRLIB_DrawImg(100, 0, intro, 0, 1, 1, GRRLIB_WHITE);

        popo++;

        if(popo >= 100)
        {
            room_goto(room_title);
        }

        if ((key_exit2)) {
            exit(0); // Exit from the game loop
        }

        GRRLIB_Render();
    }
    GRRLIB_FreeTexture(intro);

    // Cleanup code and return
    return 0;
}

//In this code is some sort of recreation of the Game Maker room handiling system, which i have yet to complete.