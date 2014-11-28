#include <p18f45k22.h>
#include "music.h"

unsigned char song[x] = {E, E, E, E, E, E, E, G, C, D, E, F, F, F, F, F, E, E, E, E, D, D, E, D, G, A, B, C2};
unsigned char length[x] = {1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1};

void play_music(void) {
    unsigned char i;
    for (i = 0; i < x; i++) {
        // Play Note
        play_note(song[i]);
        Delay10KTCYx(length[i]*10);
        // Silence
        PR2 = 0b11111001;
        T2CON = 0b00000101;
        CCPR1L = 0b00000000;
        CCP1CON = 0b00001100;
        Delay10KTCYx(2);

    }
}

void play_note(unsigned char n) {

    TRISCbits.RC2 = 0; //Set RC2 as output to send to buzzer
    switch (n) {
        case A:
            PR2 = 0b01111010;
            T2CON = 0b00000101;
            CCPR1L = 0b01110100;
            CCP1CON = 0b00111100;
            break;
        case B:
            PR2 = 0b01101101;
            T2CON = 0b00000101;
            CCPR1L = 0b01101000;
            CCP1CON = 0b00011100;
            break;
        case C2:
            PR2 = 0b01100101;
            T2CON = 0b00000101;
            CCPR1L = 0b01100000;
            CCP1CON = 0b00111100;
            break;
        case C:
            PR2 = 0b11001100;
            T2CON = 0b00000101;
            CCPR1L = 0b11000010;
            CCP1CON = 0b00101100;
            break;
        case D:
            PR2 = 0b10110101;
            T2CON = 0b00000101;
            CCPR1L = 0b10101100;
            CCP1CON = 0b00111100;
            break;
        case E:
            PR2 = 0b00101000;
            T2CON = 0b00000111;
            CCPR1L = 0b00100110;
            CCP1CON = 0b00111100;
            break;
        case F:
            PR2 = 0b10011001;
            T2CON = 0b00000101;
            CCPR1L = 0b10010010;
            CCP1CON = 0b00011100;
            break;
        case G:
            PR2 = 0b10001000;
            T2CON = 0b00000101;
            CCPR1L = 0b10000010;
            CCP1CON = 0b00001100;
            break;
        case Q:
            TRISCbits.RC2 = 1; //RC2 as input to stop playing
            break;
        default:
            break;
    }
}