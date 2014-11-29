/*
 * music.c
 * Contains all function dedicated to gameplay
 */

#include "ks0108.h"

/* DISPLAY ROW
 * Display a row in  a fixed position, according to a note
 */
void display_row(unsigned char note, unsigned char pos) {

    if (note & 0b00000001) {
        glcd_SetCursor(pos, 0);
        glcd_WriteChar8X8('O', 1);
    }
    if ((note & 0b00000010) >> 1 == 1) {
        glcd_SetCursor(pos, 2);
        glcd_WriteChar8X8('O', 1);
    }
    if ((note & 0b00000100) >> 2 == 1) {
        glcd_SetCursor(pos, 4);
        glcd_WriteChar8X8('O', 1);
    }
    if ((note & 0b001000) >> 3 == 1) {
        glcd_SetCursor(pos, 6);
        glcd_WriteChar8X8('O', 1);
    }
}

/* CLEAR ROW
 * Clears a row, surprisingly
 */
void clear_row(unsigned char pos) {
    glcd_SetCursor(pos, 0);
    glcd_WriteChar8X8(' ', 1);

    glcd_SetCursor(pos, 2);
    glcd_WriteChar8X8(' ', 1);

    glcd_SetCursor(pos, 4);
    glcd_WriteChar8X8(' ', 1);

    glcd_SetCursor(pos, 6);
    glcd_WriteChar8X8(' ', 1);
}
