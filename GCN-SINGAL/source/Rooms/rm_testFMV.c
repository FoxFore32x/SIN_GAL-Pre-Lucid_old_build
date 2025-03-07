#include <grrlib.h>
#include <ogc/video.h>
#include <stdlib.h>
#include <stdint.h>
#include <malloc.h>
#include <stdio.h>
#include <asndlib.h>
#include <gctypes.h>
#include <gccore.h>
#include <string.h>
#include <ogc/lwp.h>
#include <fat.h>  // For SD card access

#include "../Sprites/Sprites.h"
#include "../Scripts/Scripts.h"
#include "room.h"
#include "../Objects/objects.h"
#include "../Extensions/Extensions.h"

// Buffer size for MPEG2 stream
/*#define BUFFER_SIZE 4096

// File path for the video
#define VIDEO_FILE "cardb:/apps/SINGAL/data/Video/TEST.mpeg"*/

/*#include <mpeg2.h>
#include <mpeg2_internal.h>*/

// Main function to run the video playback
void rm_testFMV() {

    // Main loop for handling input and rendering
    while (RoomChanged == 0) {
        // Get input
        scr_getInput();
        StopOgg();
            while (1){

                // Clear screen
                GRRLIB_FillScreen(GRRLIB_BLACK);

                /*mpeg2_state_t state = mpeg2_parse(decoder);
                if (state == STATE_BUFFER) break;  // Need more data to continue
                if (state != STATE_SLICE) continue;  // Process only valid slices

                // Get information about the decoded frame
                info = mpeg2_info(decoder);
                uint8_t *decodedFrame = info->display_fbuf->buf[0];  // Raw frame data

                // If it's the first frame, initialize the texture
                if (!frameInitialized) {
                    frameWidth = info->width;
                    frameHeight = info->height;

                    // Create a GRRLIB texture for the video frame
                    texture = GRRLIB_CreateTexture(frameWidth, frameHeight);
                    frameInitialized = 1;
                }

                // Convert the frame data to a GRRLIB-compatible format (e.g., RGB565 or RGBA)
                for (int y = 0; y < frameHeight; ++y) {
                    for (int x = 0; x < frameWidth; ++x) {
                        // Process the decoded frame and fill the GRRLIB texture (basic RGB conversion)
                        int index = (y * frameWidth + x) * 3;  // Assuming the decoded frame is RGB
                        uint8_t r = decodedFrame[index];
                        uint8_t g = decodedFrame[index + 1];
                        uint8_t b = decodedFrame[index + 2];

                        // Set the pixel in the GRRLIB texture (RGBA format)
                        GRRLIB_SetPixelTotexImg(x, y, texture, GRRLIB_WHITE);
                    }
                }
            }*/

                // Handle debug stage select
                if (key_debug_stage_select2) {
                    room_goto(room_debug_select);
                }

                if ((key_exit2)) {
                    exit(0); // Exit from the game loop
                }

                // Render graphics
                GRRLIB_Render();
        }

            // Draw the texture on the screen
            //GRRLIB_DrawImg(0, 0, texture, 0, 1, 1, RGBA(255, 255, 255, 255));
    // Clean up
    /*fclose(mpgfile);
    GRRLIB_FreeTexture(texture);
    mpeg2_close(decoder);*/
    GRRLIB_Exit();
    }
}
