#include <grrlib.h>
#include <stdio.h>
#include <stdlib.h>
#include <gccore.h>

#include "../scr_gml.h"
#include "../../../Rooms/room.h"
#include "../../../Objects/objects.h"
#include "../../../Sprites/Sprites.h"
#include "../../Scripts.h"
#include "../../../Extensions/Extensions.h"


// Initialize MPlayer and FFmpeg
/*void initialize_mplayer() {
    av_register_all(); // Registers codecs and formats
    avformat_network_init();
}

// Load and decode video file
AVFormatContext* open_video_file(const char* filename) {
    AVFormatContext* pFormatCtx = NULL;
    if (avformat_open_input(&pFormatCtx, filename, NULL, NULL) != 0) {
        printf("Could not open video file %s\n", filename);
        return NULL;
    }

    if (avformat_find_stream_info(pFormatCtx, NULL) < 0) {
        printf("Could not retrieve stream info from %s\n", filename);
        avformat_close_input(&pFormatCtx);
        return NULL;
    }

    return pFormatCtx;
}

// Decode video frames
void decode_and_play_video(AVFormatContext* pFormatCtx) {
    AVCodecContext* pCodecCtx;
    AVCodec* pCodec;
    AVFrame* pFrame;
    AVPacket packet;

    // Find the video stream index
    int videoStreamIndex = -1;
    for (int i = 0; i < pFormatCtx->nb_streams; i++) {
        if (pFormatCtx->streams[i]->codec->codec_type == AVMEDIA_TYPE_VIDEO) {
            videoStreamIndex = i;
            break;
        }
    }

    if (videoStreamIndex == -1) {
        printf("No video stream found\n");
        return;
    }

    pCodecCtx = avcodec_alloc_context3(NULL);
    avcodec_alloc_context();
    pCodec = avcodec_find_decoder(pCodecCtx->codec_id);
    if (pCodec == NULL) {
        printf("Unsupported codec\n");
        return;
    }

    if (avcodec_open2(pCodecCtx, pCodec, NULL) < 0) {
        printf("Failed to open codec\n");
        return;
    }

    pFrame = avcodec_alloc_frame();

    // Play video frames
    while (av_read_frame(pFormatCtx, &packet) >= 0) {
        if (packet.stream_index == videoStreamIndex) {
            av_read_packet(pCodecCtx, &packet);
            avcodec_get_frame_defaults(pFrame);
        }
        av_free_packet(&packet);
    }

    av_free(&pFrame);
}

// Main function to open, decode, and play video
int playFMV(const char* VID) {

    AVFormatContext* pFormatCtx = open_video_file(VID);
    if (pFormatCtx != NULL) {
        decode_and_play_video(pFormatCtx);
        avformat_close_input(&pFormatCtx);
    }

    return 0;
}*/