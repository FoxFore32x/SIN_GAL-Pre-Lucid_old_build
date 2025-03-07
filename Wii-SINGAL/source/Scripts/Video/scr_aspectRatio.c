#include <grrlib.h>
#include <gccore.h>
#include <ogcsys.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <wiiuse/wpad.h>
#include <ogcsys.h>
#include <ogc/machine/processor.h>

#include "../../Objects/objects.h"
#include "scr_video.h"

int scrnWidth;

//static void *frameBuffer[2] = { NULL, NULL};

void InitVideo() {
    // Initialize video subsystem
    VIDEO_Init();

    rmode->viWidth = 704;
    scrnWidth = 640;

    // Get preferred video mode
    GXRModeObj *rmode = VIDEO_GetPreferredMode(NULL);

    // Adjust for 16:9 aspect ratio
    if(CONF_GetAspectRatio() == CONF_ASPECT_16_9) {
        rmode->viWidth = 711;
        scrnWidth = 854;
    }

    // Allocate framebuffer
    void *frameBuffer = MEM_K0_TO_K1(SYS_AllocateFramebuffer(rmode));

    // Set framebuffer
    VIDEO_SetNextFramebuffer(frameBuffer);
    VIDEO_Configure(rmode);
    VIDEO_SetBlack(FALSE);
    VIDEO_Flush();
    VIDEO_WaitVSync();
}