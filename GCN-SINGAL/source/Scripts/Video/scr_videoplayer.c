#include <grrlib.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gccore.h>

#include "scr_video.h"

/*void my_video_callback(plm_t *plm, plm_frame_t *frame, void *user) {
    obj_t *self = (obj_t *)user;
    // Update the texture with the new frame data
    GRRLIB_DrawImg(0, 0, self->texture, 0, 1, 1, 0xFFFFFFFF);
}

void my_audio_callback(plm_t *plm, plm_samples_t *samples, void *user) {
    // Handle audio samples here
}

void obj_create(obj_t *self) {
    if (!self) {
        printf("Invalid object pointer.\n");
        return;
    }

    // Initialize the pl_mpeg object
    self->plm = plm_create_with_filename("funny.mpg");
    if (!self->plm) {
        printf("Failed to create pl_mpeg object.\n");
        return;
    }

    // Create a GRRLIB texture to hold the video frames
    self->texture = GRRLIB_CreateEmptyTexture(640, 480); // Assuming a resolution of 640x480
    if (!self->texture) {
        plm_destroy(self->plm);
        printf("Failed to create GRRLIB texture.\n");
        return;
    }

    // Set the callbacks
    plm_set_video_decode_callback(self->plm, my_video_callback, self);
    plm_set_audio_decode_callback(self->plm, my_audio_callback, self);
}

void obj_destroy(obj_t *self) {
    if (self) {
        if (self->plm) {
            plm_destroy(self->plm);
        }
        if (self->texture) {
            GRRLIB_FreeTexture(self->texture);
        }
    }
}

void play_mpeg() {
    // Create the object
    obj_t obj;
    obj_create(&obj);

    if (!obj.plm || !obj.texture) {
        printf("Failed to initialize the object properly.\n");
        return;
    }

    // Decode. Typically called in your event loop, once per frame
    do {
        // Simulate time since last call
        double time_since_last_call = 1.0 / 60.0; // Assuming 60 FPS
        plm_decode(obj.plm, time_since_last_call);
    } while (!plm_has_ended(obj.plm));

    // All done, free memory
    obj_destroy(&obj);
}*/