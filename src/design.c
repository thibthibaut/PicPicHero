
//************************************************************************
// INCLUDES
//************************************************************************
#include <p18f45k22.h>
#include <delays.h>
#include "ks0108.h"
#include "music.h"
//************************************************************************
// Ecran d'accueil
//************************************************************************

void first_screen(void)
{
    unsigned char pic[8] = { 'P', 'I', 'C','\0'};
    unsigned char revenge[8] = { 'R', 'E', 'V', 'E', 'N', 'G', 'E', '\0' };

    // GLCD ecran d'acceuil pendant 2s

    glcd_FillScreen(1);//efface l'ecran
    play_note(F);
    glcd_SetCursor(35, 3);				//place le curseur
    glcd_WriteString(pic, f8X8, 0);	//ecrit
    Delay10KTCYx(20);					//attend 2s
    play_note(E);
    glcd_SetCursor(67,3);
    glcd_WriteString(pic, f8X8, 0);
    Delay10KTCYx(20);
    play_note(D);
    glcd_SetCursor(35, 5);				//place le curseur
    glcd_WriteString(revenge, f8X8, 1);	//ecrit
    Delay10KTCYx(50);   				//attend 2s
    play_note(Q);                       //Uch !

    glcd_FillScreen(0);					//efface l'ecran
    Delay10KTCYx(2);					//attend 0,5s
}

//************************************************************************
// Ecran presentation de l'equipe
//************************************************************************
void presentation_screen(void)
{
    unsigned char by[3] = { 'B', 'y', '\0' };
    unsigned char ihsane[7] = {'I', 'h', 's', 'a', 'n', 'e', '\0'};
    unsigned char louis[6] = { 'L', 'o', 'u', 'i', 's', '\0'};
    unsigned char thomas[7] = { 'T', 'h', 'o', 'm', 'a', 's', '\0' };
    unsigned char vincent[8] = { 'V', 'i', 'n', 'c', 'e', 'n', 't', '\0' };
    unsigned char andThibaut[10] = { '&', ' ', 'T', 'h', 'i', 'b', 'a', 'u', 't', '\0' };


    //GLCD ecran d'acceuil pendant 2s

    glcd_FillScreen(1);						//efface l'ecran
    glcd_SetCursor(54,0);					//place le curseur
    glcd_WriteString(by,f8X8,0);			//ecrit
    glcd_SetCursor(35,1);					//place le curseur
    glcd_WriteString(ihsane,f8X8,0);		//ecrit
    glcd_SetCursor(39,2);					//place le curseur
    glcd_WriteString(louis,f8X8,0);			//ecrit
    glcd_SetCursor(35,4);					//place le curseur
    glcd_WriteString(thomas,f8X8,0);		//ecrit
    glcd_SetCursor(58,6);					//place le curseur
    glcd_WriteString(vincent,f8X8,0);		//ecrit
    glcd_SetCursor(35,7);					//place le curseur
    glcd_WriteString(andThibaut,f8X8,0);	//ecrit
    Delay10KTCYx(200);						//attend 2s
    glcd_FillScreen(0);						//efface l'ecran
    Delay10KTCYx(50);						//attend 0,5s
}

//************************************************************************
// Dessin guitare
//************************************************************************
void init_guitar(char a, char b)
{
    char i = 0;
    char j = 0;

    for (i=0 ; i<4; i++)
    {
        glcd_PlotPixel(a+i,   b,   0);			//crée guitare 1
        glcd_PlotPixel(a-9,   b+29+i,   0);		//crée guitare 11bis
        glcd_PlotPixel(a+12,  b+29+i,   0);		//crée guitare 11
        glcd_PlotPixel(a+i,   b+20,   0);		//crée guitare 13bis
        glcd_PlotPixel(a+i,   b+24,   0);		//crée guitare 13
    }
    for (i=0 ; i<5; i++)
    {
        glcd_PlotPixel(a-1,   b+1+i,   0);		//crée guitare 2bis
        glcd_PlotPixel(a+4,   b+1+i,   0);		//crée guitare 2
    }
    for (i=0 ; i<4; i++)
    {
        for (j=0 ; j<12; j++)
        {
            glcd_PlotPixel(a+i,   b+6+j,   0);	//crée guitare 3
        }
    }
    for (i=0 ; i<3; i++)
    {
        glcd_PlotPixel(a-3+i,   b+15,   0);		//crée guitare 4bis
        glcd_PlotPixel(a+4+i,   b+15,   0);		//crée guitare 4
        glcd_PlotPixel(a-7,   b+18+i,   0);		//crée guitare 5bis
        glcd_PlotPixel(a+10,  b+18+i,   0);		//crée guitare 5
    }
    for (i=0 ; i<2; i++)
    {
        glcd_PlotPixel(a-5+i,   b+16,   0);		//crée guitare 6bis
        glcd_PlotPixel(a+7+i,   b+16,   0);		//crée guitare 6
        glcd_PlotPixel(a-6,   b+21+i,   0);		//crée guitare 7bis
        glcd_PlotPixel(a+9,   b+21+i,   0);		//crée guitare 7
        glcd_PlotPixel(a-5,   b+23+i,   0);		//crée guitare 8bis
        glcd_PlotPixel(a+8,   b+23+i,   0);		//crée guitare 8
        glcd_PlotPixel(a-8,   b+27+i,   0);		//crée guitare 9bis
        glcd_PlotPixel(a+11,  b+27+i,   0);		//crée guitare 9
        glcd_PlotPixel(a-6+i,   b+35,   0);		//crée guitare 10bis
        glcd_PlotPixel(a+8+i,   b+35,   0);		//crée guitare 10
    }
    for (i=0 ; i<12; i++)
    {
            glcd_PlotPixel(a-4+i,   b+36,   0);		//crée guitare 12
    }
    for (i=0 ; i<8; i++)
    {
        for (j=0 ; j<2; j++)
        {
            glcd_PlotPixel(a-2+i,  b+30+j,  0);	//crée guitare 15
        }
    }
    for (i=0 ; i<6; i++)
    {
        for (j=0 ; j<3; j++)
        {
            glcd_PlotPixel(a-1+i,  b+21+j,  0);	//crée guitare 14
        }
    }
    glcd_PlotPixel(a-6,   b+17,   0);			//crée guitare
    glcd_PlotPixel(a+9,   b+17,   0);			//crée guitare
    glcd_PlotPixel(a-6,   b+25,   0);			//crée guitare
    glcd_PlotPixel(a+9,   b+25,   0);			//crée guitare
    glcd_PlotPixel(a-7,   b+26,   0);			//crée guitare
    glcd_PlotPixel(a+10,  b+26,   0);			//crée guitare
    glcd_PlotPixel(a-8,   b+33,   0);			//crée guitare
    glcd_PlotPixel(a+11,  b+33,   0);			//crée guitare
    glcd_PlotPixel(a-7,   b+34,   0);			//crée guitare
    glcd_PlotPixel(a+10,  b+34,   0);			//crée guitare
}

//************************************************************************
// Dessin cercle
//************************************************************************
void init_circle(char a, char b)
{
    char i = 0;
    char j = 0;

    for (i=0 ; i<3; i++)
    {
        glcd_PlotPixel(a+11+i,   b,   1);		//crée cercle
        glcd_PlotPixel(a+11+i,   b+9,   1);		//crée cercle
    }
    for (i=0 ; i<7; i++)
    {
        glcd_PlotPixel(a+9+i,   b+1,   1);		//crée cercle
        glcd_PlotPixel(a+9+i,   b+8,   1);		//crée cercle
    }
    for (i=0 ; i<13; i++)
    {
        glcd_PlotPixel(a+6+i,   b+2,   1);		//crée cercle
        glcd_PlotPixel(a+6+i,   b+7,   1);		//crée cercle
    }
    for (i=0 ; i<19; i++)
    {
        glcd_PlotPixel(a+3+i,   b+3,   1);		//crée cercle
        glcd_PlotPixel(a+3+i,   b+6,   1);		//crée cercle
    }
    for (i=0 ; i<24; i++)
    {
        for (j=0 ; j<2; j++)
        {
            glcd_PlotPixel(a,  b+4+j,  1);	//crée cercle
        }
    }
}
//************************************************************************
// Effacer cercle
//************************************************************************
void remove_circle(char a, char b)
{
    char i = 0;
    char j = 0;
	
    for (i=0 ; i<3; i++)
    {
        glcd_PlotPixel(a+11+i,   b,   0);		//crée cercle
        glcd_PlotPixel(a+11+i,   b+9,   0);		//crée cercle
    }
    for (i=0 ; i<7; i++)
    {
        glcd_PlotPixel(a+9+i,   b+1,   0);		//crée cercle
        glcd_PlotPixel(a+9+i,   b+8,   0);		//crée cercle
    }
    for (i=0 ; i<13; i++)
    {
        glcd_PlotPixel(a+6+i,   b+2,   0);		//crée cercle
        glcd_PlotPixel(a+6+i,   b+7,   0);		//crée cercle
    }
    for (i=0 ; i<19; i++)
    {
        glcd_PlotPixel(a+3+i,   b+3,   0);		//crée cercle
        glcd_PlotPixel(a+3+i,   b+6,   0);		//crée cercle
    }
    for (i=0 ; i<24; i++)
    {
        for (j=0 ; j<2; j++)
        {
            glcd_PlotPixel(a,  b+4+j,  0);	//crée cercle
        }
    }
}

//************************************************************************
// Debut jeu
//************************************************************************
void init_game(void)
{
    char d;	//deplacement

    for (d = 0; d < 60; d++)
    {
        init_circle (54, d);
        remove_circle (54, d);
    }
}

