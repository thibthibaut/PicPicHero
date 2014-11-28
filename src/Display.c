
#include <p18f45k22.h>
#include <delays.h>
#include "ks0108.h"
#include "design.h"
#include "Display.h"

void display_game(char * tab)
{
	unsigned char string1[3] = { 'P', '1', '\0' };
	unsigned char string2[3] = { 'P', '2', '\0' };
	
	///We first clear the screen
	glcd_FillScreen(0);
	
	///Then we display the scores
	///Player 1
	glcd_SetCursor(3,2);//We need to find the rigth place 				//place le curseur
	glcd_WriteString(string1,f8X8,1);	//ecrit 
	///TO DO re^placer cursor 
//	glcd_WriteChar3x6(Score_P1,1);
	
	///Player 2
	glcd_SetCursor(110,2);//We need to find the rigth place 				//place le curseur
	glcd_WriteString(string2,f8X8,1);	//ecrit
	///TO DO Replacer cursor
//	glcd_WriteChar3x6(Score_P2,1);
	
	///Then we display the first Row
//	Display_Row (tab[k+3],i+0);	//i goes from
	///Second Row
//	Display_Row(tab[k+2],i+16);
	///Third row
//	Display_Row(tab[k+1],i+32);
	///Fourth row
//	Display_Row(tab[k+0],i+48);
	
	///And Finally the frame of the rectangle.
	//To DO Display game rectangle
	
}


/*Function that will display a row of four circles, using the ones and zeros in the char*/

void display_Row(char Row, unsigned char Y_Center){
	
	char  i; 	
	//for the 4 collumns 
	for (i=0;i<4;i++){
		//We see if there's a circle to plot
		if(Get_n_bit(Row, i)){
				//if yes we plot the circle
				init_circle((char)32*i, Y_Center);	
		}	
	}	
}