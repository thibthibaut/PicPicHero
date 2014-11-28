#include "mask.h"


char Get_n_bit( char Data, char pos){
	return ((1<<pos)&Data)>>pos;
}