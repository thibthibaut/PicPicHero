/* 
 * File:   main.c
 * Author: Vince
 *
 * Created on 25 novembre 2014, 13:58
 */

#include <stdio.h>
#include <stdlib.h>

#include <p18f45k22.h>

#include "ks0108.h"
#include "design.h"
#include "music.h"
#include "game.h"

unsigned char dc;
int i, ynote;

unsigned char song_[x] = {E, E, E, E, E, E, E, G, C, D, E, F, F, F, F, F, E, E, E, E, D, D, E, D, G, A, B, C2};
unsigned char length_[x] = {1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1};

/*
 * 
 */
void main(void) {
    //Init port
    ADCON1 = 0x0F;
    TRISAbits.TRISA0 = 1;

    TRISB = 0;		//PORTB output
    PORTB = 0; 		//Reset PORTB

    TRISD = 0xff;	//PORTD input
    PORTD = 0; 		//Reset PORTD

    TRISC = 0b11111001;	// Make pin 17 (RC1/CCP2) an output


    TRISE = 0x00;       // PORTE output

    glcd_Init(1);






    //--------------------TEST--------------------------
    display_row(C, 0);
    display_row(D, 12);
    display_row(E, 22);
    display_row(F, 32);
    display_row(G, 42);
    display_row(A, 52);
    display_row(B, 62);
    display_row(C2, 72);
    display_row(Q, 82);
    

    //---------END TEST----------------------------------3

   // ynote=0;
    while(1){
        //play_music();

        //glcd_SetCursor(ynote, 6);
        //glcd_WriteChar8X8('O', 1);

        //Delay10KTCYx(4);
        
        //glcd_SetCursor(ynote, 6);
        //glcd_WriteChar8X8(' ', 1);

       // for (i = 0; i < 8; i++)
       // {
        //   glcd_SetCursor(127-16, i);
       //    glcd_WriteChar8X8('|', 1);
      //  }

      //  ynote += 4;

        

        
        
    }
}

