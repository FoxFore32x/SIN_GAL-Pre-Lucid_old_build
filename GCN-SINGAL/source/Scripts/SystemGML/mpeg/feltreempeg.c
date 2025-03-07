/*#include <ogcsys.h>
#include <gccore.h>
#include <malloc.h>
#include <string.h>
#include <ogc/audio.h>
#include <ogc/video.h>
#include <ogc/gx.h>
#include "mpeg.h"

// MPEG player instance
static mpeg_player_t *player;

void video_open(const char *Video){
    // Create MPEG player
    player = mpeg_player_create(Video);
}

void video_enable_loop(bool loop)   // Set loop playback
{
    if (loop == true)
    {
        mpeg_player_set_loop(player, 1);
    }
    else
    {
        mpeg_player_set_loop(player, 0);
    }

}

void video_draw(){
    // Start MPEG playback
    mpeg_play(player, 1);
    mpeg_player_destroy(player);
}*/