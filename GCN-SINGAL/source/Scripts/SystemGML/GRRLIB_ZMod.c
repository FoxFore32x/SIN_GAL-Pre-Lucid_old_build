#include <grrlib.h>
#include <ogc/video.h>
#include <stdlib.h>
#include <math.h>
#include <malloc.h>
#include <stdarg.h>
#include <pngu.h>
//#include <wiiuse/wpad.h>
#include <mp3player.h>
#include <stdio.h>
#include <asndlib.h>
#include <gctypes.h>
#include <unistd.h> // For usleep()
#include <gccore.h>
//#include <pngu.h>
#include <ogc/lwp.h>  // For threading
#include <ogc/lwp_watchdog.h> // For gettime() and ticks_to_secs()
#include <ogc/mutex.h>  // For mutex if needed

#include "GRRLIB_ZMod.h"
#include "scr_gml.h"
#include "../../Rooms/room.h"
#include "../../Objects/objects.h"
#include "../../Sprites/Sprites.h"
#include "../Scripts.h"
#include "../../Extensions/Extensions.h"

//############## TTF Font Z Modification

/*static FT_Library ftLibrary; /**< A handle to a FreeType library instance. 

/**
 * Draw a character on the screen.
 * @param bitmap Bitmap to draw.
 * @param offset x-coordinate offset.
 * @param top y-coordinate.
 * @param cR Red component of the colour.
 * @param cG Green component of the colour.
 * @param cB Blue component of the colour.
 * @param cA Alpha component of the colour.
 * @param Layer It handles the Z position of the Text
 
static void DrawBitmapM(FT_Bitmap *bitmap, int offset, int top, const u8 cR, const u8 cG, const u8 cB, const u8 cA, f32 Layer) {
    const FT_Int x_max = offset + bitmap->width;
    const FT_Int y_max = top + bitmap->rows;

    for (FT_Int i = offset, p = 0; i < x_max; i++, p++ ) {
        for (FT_Int j = top, q = 0; j < y_max; j++, q++ ) {
            s16 alpha = bitmap->buffer[ q * bitmap->width + p ] - (0xFF - cA);
            if(alpha < 0) {
                alpha = 0;
            }
            GX_Begin(GX_POINTS, GX_VTXFMT0, 1);
                GX_Position3f32(i, j, Layer);
                GX_Color4u8(cR, cG, cB, alpha);
            GX_End();
        }
    }
}

/**
 * Print function for TTF font.
 * @author wplaat and DrTwox
 * @param x Specifies the x-coordinate of the upper-left corner of the text.
 * @param y Specifies the y-coordinate of the upper-left corner of the text.
 * @param z Specifies the z-coordinate of the upper-left corner of the text.
 * @param myFont A TTF.
 * @param utf32 Text to draw.
 * @param fontSize Size of the font.
 * @param color Text color in RGBA format.
 
void GRRLIBM_PrintfTTFW(int x, int y, int z, GRRLIB_ttfFont *myFont, const wchar_t *utf32, unsigned int fontSize, const u32 color) {
    if (myFont == NULL || utf32 == NULL) {
        return;
    }

    FT_Face Face = (FT_Face)myFont->face;
    int penX = 0;
    int penY = fontSize;
    FT_GlyphSlot slot = Face->glyph;
    FT_UInt previousGlyph = 0;
    const u8 cR = R(color);
    const u8 cG = G(color);
    const u8 cB = B(color);
    const u8 cA = A(color);

    if (FT_Set_Pixel_Sizes(Face, 0, fontSize) != 0) {
        FT_Set_Pixel_Sizes(Face, 0, 12);
    }

    /* Loop over each character, until the
     * end of the string is reached, or until the pixel width is too wide 
    while(*utf32) {
        const FT_UInt glyphIndex = FT_Get_Char_Index(myFont->face, *utf32++);

        if (myFont->kerning && previousGlyph && glyphIndex) {
            FT_Vector delta;
            FT_Get_Kerning(myFont->face, previousGlyph, glyphIndex, FT_KERNING_DEFAULT, &delta);
            penX += delta.x >> 6;
        }
        if (FT_Load_Glyph(myFont->face, glyphIndex, FT_LOAD_RENDER) != 0) {
            continue;
        }

        DrawBitmapM(&slot->bitmap,
                   penX + slot->bitmap_left + x,
                   penY - slot->bitmap_top + y,
                   cR, cG, cB, cA, z);
        penX += slot->advance.x >> 6;
        previousGlyph = glyphIndex;
    }
}

/**
 * Print function for TTF font.
 * @param x Specifies the x-coordinate of the upper-left corner of the text.
 * @param y Specifies the y-coordinate of the upper-left corner of the text.
 * @param z Specifies the z-coordinate of the upper-left corner of the text.
 * @param myFont A TTF.
 * @param string Text to draw.
 * @param fontSize Size of the font.
 * @param color Text color in RGBA format.
 
void GRRLIBM_PrintfTTF(int x, int y, int z, GRRLIB_ttfFont *myFont, const char *string, unsigned int fontSize, const u32 color) {
    if (myFont == NULL || string == NULL) {
        return;
    }

    size_t length = strlen(string) + 1;
    wchar_t *utf32 = (wchar_t*)malloc(length * sizeof(wchar_t));
    if (utf32 != NULL) {
        length = mbstowcs(utf32, string, length);
        if (length > 0) {
            utf32[length] = L'\0';
            GRRLIBM_PrintfTTFW(x, y, z, myFont, utf32, fontSize, color);
        }
        free(utf32);
    }
}*/