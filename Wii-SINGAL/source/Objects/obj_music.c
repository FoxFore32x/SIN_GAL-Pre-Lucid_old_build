#include <grrlib.h>
#include <ogc/video.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>
#include <wiiuse/wpad.h>
#include <mp3player.h>
#include <stdio.h>
#include <asndlib.h>
#include <gctypes.h>
#include <gccore.h>

#include "objects.h"

int mp3Reader(void *cbdata, void *dst, int size) {
        FILE *file = cbdata;
        return fread(dst,1,size,file);
}

// Function to play MP3 file from SD card
void play(const char *BG_music) {
    // Create a string to hold the file path
    char filepath[100]; // Adjust the size as needed
    sprintf(filepath, "sd:/apps/SINGAL/data/BGM/%s.mp3", BG_music);

    // Open the MP3 file for reading
    FILE *myFile = fopen(filepath, "rb"); // Open in binary mode
    if (myFile == NULL) {
        // Handle file open error
        printf("Error opening file: %s\n", filepath);
        return;
    }

    MP3Player_PlayFile(myFile, &mp3Reader, NULL);

    // Start streaming and playing the MP3 file
    /*if (MP3Player_PlayFile(myFile, &mp3Reader, NULL) != 0) {
        // Handle playback error
        printf("Error playing file: %s\n", filepath);
        fclose(myFile);
        return;
    }*/
}

void obj_music(const char* BGM, bool loop) {
    // Check if the music is already playing when looping
    if (loop && MP3Player_IsPlaying()) {
        return;
    }

    // Play the music
    play(BGM);
}