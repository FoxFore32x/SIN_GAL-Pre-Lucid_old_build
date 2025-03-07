// scr_gml.h
#ifndef SCR_VIDEO_H
#define SCR_VIDEO_H

#define SCREEN_WIDTH 640 // Set your screen width
#define SCREEN_HEIGHT 480 // Set your screen height

extern int scrnWidth;

void GRRLIB_Widescreen(bool wd_on);

// scr_video.c
void InitVideo();

//scr_videoplayer.h

#include "../../Extensions/Extensions.h"

/*static inline void YUVtoRGB(uint8_t y, uint8_t u, uint8_t v, uint8_t *r, uint8_t *g, uint8_t *b);
static void convert_frame_to_texture(plm_frame_t *frame, uint8_t *rgb_buffer);
static void display_frame(GRRLIB_texImg *tex, uint8_t *rgb_buffer);
static void on_video_decode(plm_t *plm, plm_frame_t *frame, void *user_data);
void play_mpeg_video(const char *filename);
int play_mpeg_video_from_sd(const char *filename);*/

/*void my_video_callback(plm_t *plm, plm_frame_t *frame, void *user);
void my_audio_callback(plm_t *plm, plm_samples_t *samples, void *user);
void decode_mpeg(const char *filename);
void play_mpeg();*/

/*typedef struct {
    plm_t *plm;
    GRRLIB_texImg *texture;
} obj_t;

void obj_create(obj_t *self);
void obj_method_a(obj_t *self);
void obj_method_b(obj_t *self);
void obj_destroy(obj_t *self);

void my_video_callback(plm_t *plm, plm_frame_t *frame, void *user);
void my_audio_callback(plm_t *plm, plm_samples_t *samples, void *user);
void play_mpeg();*/

#endif // SCR_GML_H