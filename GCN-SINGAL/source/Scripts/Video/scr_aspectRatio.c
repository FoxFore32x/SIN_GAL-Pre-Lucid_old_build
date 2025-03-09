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
        rmode->viHeight = 528;
	}

    VIDEO_Configure (rmode);
}

void * Initialise1() {
	void *framebuffer;

	VIDEO_Init();

	// Get the default video mode first
	rmode = VIDEO_GetPreferredMode(NULL);

	// Force 4:3 aspect ratio (centered)
	rmode->viXOrigin = (VI_MAX_WIDTH_NTSC - 640) / 2;
	rmode->viYOrigin = (VI_MAX_HEIGHT_NTSC - 480) / 2;

    // Set correct resolution
	rmode->viWidth = 704;
	rmode->viHeight = 480;
	rmode->fbWidth = 640;
    rmode->xfbHeight = 480;
	rmode->efbHeight = 480;

	// Allocate framebuffer
	framebuffer = MEM_K0_TO_K1(SYS_AllocateFramebuffer(rmode));
	console_init(framebuffer, 20, 20, rmode->fbWidth, rmode->xfbHeight, rmode->fbWidth * VI_DISPLAY_PIX_SZ);

	// Apply video settings
	VIDEO_Configure(rmode);
	VIDEO_SetNextFramebuffer(framebuffer);
	VIDEO_SetBlack(FALSE);
	VIDEO_Flush();
	VIDEO_WaitVSync();
	if (rmode->viTVMode & VI_NON_INTERLACE) VIDEO_WaitVSync();

	return framebuffer;
}
