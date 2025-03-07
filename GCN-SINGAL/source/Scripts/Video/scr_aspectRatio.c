#include <grrlib.h>
#include <gccore.h>
#include <ogcsys.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
//#include <wiiuse/wpad.h>
#include <ogcsys.h>
#include <ogc/machine/processor.h>

#include "../../Objects/objects.h"
#include "scr_video.h"

int scrnWidth;

//static void *frameBuffer[2] = { NULL, NULL};

void GRRLIB_Widescreen(bool wd_on) {
	// This is meant to fix widescreen TVs
	if (wd_on) {
		rmode->viWidth = 678; 
		rmode->viXOrigin = (VI_MAX_WIDTH_PAL - 678) / 2;
	}
	else {
		rmode->viWidth = 640; 
		rmode->viXOrigin = (VI_MAX_WIDTH_PAL - 640) / 2;
	}

    VIDEO_Configure (rmode);
}

void InitVideo() {
    // Initialize video subsystem
    VIDEO_Init();

    // Get preferred video mode
    GXRModeObj *rmode = VIDEO_GetPreferredMode(NULL);

    rmode->viWidth = 640;
    scrnWidth = 640;

    // Adjust for 16:9 aspect ratio
    /*if(CONF_GetAspectRatio() == CONF_ASPECT_16_9) {
        rmode->viWidth = 711;
        scrnWidth = 854;
    }*/

    // Allocate framebuffers
    void *frameBuffer[2];
    for (int i = 0; i < 2; ++i) {
        frameBuffer[i] = MEM_K0_TO_K1(SYS_AllocateFramebuffer(rmode));
    }

    // Set double buffering
    VIDEO_SetNextFramebuffer(frameBuffer[0]);
    VIDEO_Configure(rmode);
    VIDEO_SetBlack(FALSE);
    VIDEO_Flush();

    // Enable vertical sync
    VIDEO_WaitVSync();

    // Swap buffers
    VIDEO_SetNextFramebuffer(frameBuffer[1]);
    VIDEO_Flush();
    VIDEO_WaitVSync();
}