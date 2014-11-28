#line 1 "src/GLCD.c"
#line 1 "src/GLCD.c"

#line 10 "src/GLCD.c"
 
#line 1 "src/GLCD.h"

#line 10 "src/GLCD.h"
 


#line 14 "src/GLCD.h"

typedef signed char int8_t;

typedef unsigned char uint8_t;

typedef signed int int16_t;

typedef unsigned int uint16_t;

typedef signed long int int32_t;

typedef unsigned long int uint32_t;

typedef signed long long int int64_t;

typedef unsigned long long int uint64_t;


typedef uint8_t boolean;
typedef uint8_t byte;

#line 36 "src/GLCD.h"


#line 1 "src/GLCD_Pins.h"

#line 7 "src/GLCD_Pins.h"
 


#line 11 "src/GLCD_Pins.h"



#line 15 "src/GLCD_Pins.h"
#line 16 "src/GLCD_Pins.h"

#line 18 "src/GLCD_Pins.h"
#line 19 "src/GLCD_Pins.h"
#line 20 "src/GLCD_Pins.h"
#line 21 "src/GLCD_Pins.h"

#line 23 "src/GLCD_Pins.h"
#line 24 "src/GLCD_Pins.h"
#line 25 "src/GLCD_Pins.h"

#line 27 "src/GLCD_Pins.h"
#line 41 "src/GLCD_Pins.h"
#line 43 "src/GLCD_Pins.h"


#line 46 "src/GLCD_Pins.h"
#line 47 "src/GLCD_Pins.h"

#line 49 "src/GLCD_Pins.h"
#line 38 "src/GLCD.h"


#line 41 "src/GLCD.h"
#line 42 "src/GLCD.h"


#line 45 "src/GLCD.h"

#line 47 "src/GLCD.h"
#line 48 "src/GLCD.h"


#line 55 "src/GLCD.h"
#line 56 "src/GLCD.h"
#line 57 "src/GLCD.h"
#line 58 "src/GLCD.h"
#line 59 "src/GLCD.h"

#line 61 "src/GLCD.h"
#line 62 "src/GLCD.h"

#line 64 "src/GLCD.h"


#line 67 "src/GLCD.h"
#line 68 "src/GLCD.h"


#line 71 "src/GLCD.h"
#line 72 "src/GLCD.h"


#line 75 "src/GLCD.h"
#line 76 "src/GLCD.h"
#line 77 "src/GLCD.h"
#line 78 "src/GLCD.h"
#line 79 "src/GLCD.h"
#line 80 "src/GLCD.h"





typedef struct {
    uint8_t x;
    uint8_t y;
    uint8_t page;
} lcdCoord;

typedef uint8_t(*FontCallback)(const uint8_t*);

uint8_t ReadPgmData(const uint8_t* ptr); 

#line 96 "src/GLCD.h"
#line 97 "src/GLCD.h"
#line 98 "src/GLCD.h"
#line 99 "src/GLCD.h"
#line 100 "src/GLCD.h"
#line 101 "src/GLCD.h"


void GLCD_Init(boolean invert);
void GLCD_GotoXY(uint8_t x, uint8_t y);


void GLCD_ClearPage(uint8_t page, uint8_t color);
void GLCD_ClearScreen(uint8_t color);
void GLCD_DrawLine(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2, uint8_t color);
void GLCD_DrawRect(uint8_t x, uint8_t y, uint8_t width, uint8_t height, uint8_t color);
void GLCD_DrawRoundRect(uint8_t x, uint8_t y, uint8_t width, uint8_t height, uint8_t radius, uint8_t color);
void GLCD_FillRect(uint8_t x, uint8_t y, uint8_t width, uint8_t height, uint8_t color);
void GLCD_InvertRect(uint8_t x, uint8_t y, uint8_t width, uint8_t height);
void GLCD_SetInverted(boolean invert);
void GLCD_SetDot(uint8_t x, uint8_t y, uint8_t color);
void GLCD_DrawBitmap(const uint8_t *bitmap, uint8_t x, uint8_t y, uint8_t color);


void GLCD_SelectFontEx(const uint8_t* font, uint8_t color, FontCallback callback);
int GLCD_PutChar(char c);
void GLCD_Puts(const char *str);
void GLCD_PrintNumber(long n);
void GLCD_PrintHexNumber(uint16_t n);
void GLCD_PrintRealNumber(double n);
void GLCD_CursorTo(uint8_t x, uint8_t y); 

uint8_t GLCD_CharWidth(char c);
uint16_t GLCD_StringWidth(const char *str);

#line 131 "src/GLCD.h"
#line 11 "src/GLCD.c"


#line 14 "src/GLCD.c"

#line 16 "src/GLCD.c"

 
#line 19 "src/GLCD.c"
#line 20 "src/GLCD.c"

#line 22 "src/GLCD.c"
#line 23 "src/GLCD.c"

#line 25 "src/GLCD.c"
#line 26 "src/GLCD.c"


#line 34 "src/GLCD.c"
#line 35 "src/GLCD.c"


#line 40 "src/GLCD.c"
#line 41 "src/GLCD.c"


#line 54 "src/GLCD.c"
#line 55 "src/GLCD.c"


#line 60 "src/GLCD.c"
#line 61 "src/GLCD.c"


#line 76 "src/GLCD.c"
#line 77 "src/GLCD.c"

 
static lcdCoord GLCD_Coord;
static boolean GLCD_Inverted;
static FontCallback GLCD_FontRead;
static uint8_t GLCD_FontColor;
static const uint8_t* GLCD_Font;

 
uint8_t GLCD_DoReadData(uint8_t first);
void GLCD_WriteData(uint8_t data); 



void GLCD_ClearPage(uint8_t page, uint8_t color)
{
    for (uint8_t x = 0; x < 128 ; x++) {
        GLCD_GotoXY(x, page * 8);
        GLCD_WriteData(color);
    }
}

void GLCD_ClearScreen(uint8_t color)
{
    uint8_t page;
    for (page = 0; page < 8; page++) {
        GLCD_GotoXY(0, page * 8);
        GLCD_ClearPage(page, color);
    }
}


#line 111 "src/GLCD.c"
 

#line 114 "src/GLCD.c"

#line 121 "src/GLCD.c"
#line 122 "src/GLCD.c"

void GLCD_DrawLine(uint8_t x1, uint8_t y1, uint8_t x2, uint8_t y2, uint8_t color)
{
    uint8_t deltax, deltay, x, y, steep;
    int8_t error, ystep;

    steep = ((y1>y2) ? (y1-y2) : (y2-y1))  > ((x1>x2) ? (x1-x2) : (x2-x1)) ;

    if (steep) {
        do{uint8_t t; t=x1; x1=y1; y1=t;} while(0) ;
        do{uint8_t t; t=x2; x2=y2; y2=t;} while(0) ;
    }

    if (x1 > x2) {
        do{uint8_t t; t=x1; x1=x2; x2=t;} while(0) ;
        do{uint8_t t; t=y1; y1=y2; y2=t;} while(0) ;
    }

    deltax = x2 - x1;
    deltay = ((y2>y1) ? (y2-y1) : (y1-y2)) ;
    error = deltax / 2;
    y = y1;
    if (y1 < y2) ystep = 1;
    else ystep = -1;

    for (x = x1; x <= x2; x++) {
        if (steep) GLCD_SetDot(y, x, color);
        else GLCD_SetDot(x, y, color);
        error = error - deltay;
        if (error < 0) {
            y = y + ystep;
            error = error + deltax;
        }
    }
}

void GLCD_DrawRect(uint8_t x, uint8_t y, uint8_t width, uint8_t height, uint8_t color)
{
    GLCD_FillRect(x, y, width, 0, color) ; 
    GLCD_FillRect(x, y + height, width, 0, color) ; 
    GLCD_FillRect(x, y, 0, height, color) ; 
    GLCD_FillRect(x + width, y, 0, height, color) ; 
}

void GLCD_DrawRoundRect(uint8_t x, uint8_t y, uint8_t width, uint8_t height, uint8_t radius, uint8_t color)
{
    int16_t tSwitch, x1 = 0, y1 = radius;
    tSwitch = 3 - 2 * radius;

    while (x1 <= y1) {
        GLCD_SetDot(x + radius - x1, y + radius - y1, color);
        GLCD_SetDot(x + radius - y1, y + radius - x1, color);

        GLCD_SetDot(x + width - radius + x1, y + radius - y1, color);
        GLCD_SetDot(x + width - radius + y1, y + radius - x1, color);

        GLCD_SetDot(x + width - radius + x1, y + height - radius + y1, color);
        GLCD_SetDot(x + width - radius + y1, y + height - radius + x1, color);

        GLCD_SetDot(x + radius - x1, y + height - radius + y1, color);
        GLCD_SetDot(x + radius - y1, y + height - radius + x1, color);

        if (tSwitch < 0) {
            tSwitch += (4 * x1 + 6);
        } else {
            tSwitch += (4 * (x1 - y1) + 10);
            y1--;
        }
        x1++;
    }

    GLCD_FillRect(x + radius, y, width - (2 * radius), 0, color) ; 
    GLCD_FillRect(x + radius, y + height, width - (2 * radius), 0, color) ; 
    GLCD_FillRect(x, y + radius, 0, height - (2 * radius), color) ; 
    GLCD_FillRect(x + width, y + radius, 0, height - (2 * radius), color) ; 
}


#line 201 "src/GLCD.c"
 
void GLCD_FillRect(uint8_t x, uint8_t y, uint8_t width, uint8_t height, uint8_t color)
{
    uint8_t mask, pageOffset, h, i, data;
    height++;

    pageOffset = y % 8;
    y -= pageOffset;
    mask = 0xFF;
    if (height < 8 - pageOffset) {
        mask >>= (8 - height);
        h = height;
    } else {
        h = 8 - pageOffset;
    }
    mask <<= pageOffset;

    GLCD_GotoXY(x, y);
    for (i = 0; i <= width; i++) {
        do { GLCD_DoReadData(1); data = GLCD_DoReadData(0); } while (0) ;

        if (color == 0xFF ) {
            data |= mask;
        } else {
            data &= ~mask;
        }

        GLCD_WriteData(data);
    }

    while (h + 8 <= height) {
        h += 8;
        y += 8;
        GLCD_GotoXY(x, y);

        for (i = 0; i <= width; i++) {
            GLCD_WriteData(color);
        }
    }

    if (h < height) {
        mask = ~(0xFF << (height - h));
        GLCD_GotoXY(x, y + 8);

        for (i = 0; i <= width; i++) {
            do { GLCD_DoReadData(1); data = GLCD_DoReadData(0); } while (0) ;

            if (color == 0xFF ) {
                data |= mask;
            } else {
                data &= ~mask;
            }

            GLCD_WriteData(data);
        }
    }
}

void GLCD_InvertRect(uint8_t x, uint8_t y, uint8_t width, uint8_t height)
{
    uint8_t mask, pageOffset, h, i, data, tmpData;
    height++;

    pageOffset = y % 8;
    y -= pageOffset;
    mask = 0xFF;
    if (height < 8 - pageOffset) {
        mask >>= (8 - height);
        h = height;
    } else {
        h = 8 - pageOffset;
    }
    mask <<= pageOffset;

    GLCD_GotoXY(x, y);
    for (i = 0; i <= width; i++) {
        do { GLCD_DoReadData(1); data = GLCD_DoReadData(0); } while (0) ;
        tmpData = ~data;
        data = (tmpData & mask) | (data & ~mask);
        GLCD_WriteData(data);
    }

    while (h + 8 <= height) {
        h += 8;
        y += 8;
        GLCD_GotoXY(x, y);

        for (i = 0; i <= width; i++) {
            do { GLCD_DoReadData(1); data = GLCD_DoReadData(0); } while (0) ;
            GLCD_WriteData(~data);
        }
    }

    if (h < height) {
        mask = ~(0xFF << (height - h));
        GLCD_GotoXY(x, y + 8);

        for (i = 0; i <= width; i++) {
            do { GLCD_DoReadData(1); data = GLCD_DoReadData(0); } while (0) ;
            tmpData = ~data;
            data = (tmpData & mask) | (data & ~mask);
            GLCD_WriteData(data);
        }
    }
}

void GLCD_SetInverted(boolean invert)
{ 
    if (GLCD_Inverted != invert) {
        GLCD_InvertRect(0, 0, 128  - 1, 64  - 1);
        GLCD_Inverted = invert;
    }
}

void GLCD_SetDot(uint8_t x, uint8_t y, uint8_t color)
{
    uint8_t data;

    GLCD_GotoXY(x, y - y % 8); 

    do { GLCD_DoReadData(1); data = GLCD_DoReadData(0); } while (0) ;
    if (color == 0xFF ) {
        data |= 0x01 << (y % 8); 
    } else {
        data &= ~(0x01 << (y % 8)); 
    }
    GLCD_WriteData(data); 
}





uint8_t ReadPgmData(const uint8_t* ptr)
{
    return *ptr;
}

void GLCD_SelectFontEx(const uint8_t* font, uint8_t color, FontCallback callback)
{
    GLCD_Font = font;
    GLCD_FontRead = callback;
    GLCD_FontColor = color;
}

void GLCD_PrintNumber(long n)
{
    byte buf[10]; 
    byte i = 0;
    if (n == 0)
        GLCD_PutChar('0');
    else {
        if (n < 0) {
            GLCD_PutChar('-');
            n = -n;
        }
        while (n > 0 && i <= 10) {
            buf[i++] = n % 10; 
            n /= 10; 
        }
        for (; i > 0; i--)
            GLCD_PutChar((char) (buf[i - 1] < 10 ? '0' + buf[i - 1] : 'A' + buf[i - 1] - 10));
    }
}

void GLCD_PrintHexNumber(uint16_t n)
{
    int8_t i;
    uint8_t d, previous_write = 0;

    if (n == 0) {
        GLCD_PutChar('0');
        return;
    }
    
    for (i=3; i>=0; i--) {
        d = ((0x0F << i*4) & n) >> i*4;

        if (d < 0xA)
            d += '0';
        else
            d = (d - 0xA) + 'A';
        
        if (d != '0' || previous_write) {
            GLCD_PutChar((char) d);
            previous_write = 1;
        }
    }
}

void GLCD_PrintRealNumber(double n)
{
    long int_part, frac_part;
    uint8_t sign = 0;

    if (n < 0) {
        sign = 1;
        n *= -1;
    }
    
    int_part = (long)n;
    frac_part = (long)((n - (double)int_part)*1000000);
    if (sign) GLCD_PutChar('-');
    GLCD_PrintNumber(int_part);
    GLCD_PutChar('.');

    while ((frac_part != 0) && (frac_part % 10 == 0)) {
        frac_part /= 10;
    }
    
    GLCD_PrintNumber(frac_part);
}

#line 415 "src/GLCD.c"

int GLCD_PutChar(char c)
{
    if (GLCD_Font == 0)
        return 0; 

    
#line 423 "src/GLCD.c"
 

    if (c < 0x20) {
        
        return 1;
    }

    uint8_t width = 0;
    uint8_t height = GLCD_FontRead(GLCD_Font + 3 );
    uint8_t bytes = (height + 7) / 8;  

    uint8_t firstChar = GLCD_FontRead(GLCD_Font + 4 );
    uint8_t charCount = GLCD_FontRead(GLCD_Font + 5 );

    uint16_t index = 0;
    uint8_t x = GLCD_Coord.x, y = GLCD_Coord.y;
    uint8_t thielefont;

    if (c < firstChar || c >= (firstChar + charCount)) {
        return 0; 
    }
    c -= firstChar;

    if ((GLCD_FontRead(GLCD_Font+0 ) == 0 && GLCD_FontRead(GLCD_Font+0 +1) == 0) ) {
        thielefont = 0;
        width = GLCD_FontRead(GLCD_Font + 2 );
        index = c * bytes * width + 6 ;
    } else {
        
        thielefont = 1;
        
#line 458 "src/GLCD.c"
 
        for (uint8_t i = 0; i < c; i++) {
            index += GLCD_FontRead(GLCD_Font + 6  + i);
        }
        
#line 473 "src/GLCD.c"
 

        index = index * bytes + charCount + 6 ;

        
#line 479 "src/GLCD.c"
 
        width = GLCD_FontRead(GLCD_Font + 6  + c);
    }

    

#line 497 "src/GLCD.c"

#line 513 "src/GLCD.c"
#line 537 "src/GLCD.c"

     

    
#line 556 "src/GLCD.c"
 

    uint8_t pixels = height + 1;  
    uint8_t p;
    uint8_t dy;
    uint8_t tfp;
    uint8_t dp;
    uint8_t dbyte;
    uint8_t fdata;

    for (p = 0; p < pixels;) {
        dy = y + p;

        
#line 571 "src/GLCD.c"
 

        GLCD_GotoXY(x, (dy & ~7));

        uint16_t page = p / 8 * width; 

        for (uint8_t j = 0; j < width; j++)   {

            
#line 593 "src/GLCD.c"
 

            if (p >= height) {
                
#line 598 "src/GLCD.c"
 
                fdata = 0;
            } else {
                fdata = GLCD_FontRead(GLCD_Font + index + page + j);

                
#line 609 "src/GLCD.c"
 
                if (thielefont && (height - (p&~7)) < 8) {
                    fdata >>= 8 - (height & 7);
                }
            }

            if (GLCD_FontColor == 0x00 )
                fdata ^= 0xff;  


            
#line 622 "src/GLCD.c"
 

            if (!(dy & 7) && !(p & 7) && ((pixels - p) >= 8)) {
                
#line 630 "src/GLCD.c"
 

                GLCD_WriteData(fdata);
                continue;
            } else {
                
#line 637 "src/GLCD.c"
 
                do { GLCD_DoReadData(1); dbyte = GLCD_DoReadData(0); } while (0) ;
            }

            
#line 646 "src/GLCD.c"
 


            tfp = p;  
            dp = dy & 7;  

            
#line 655 "src/GLCD.c"
 
            while ((dp <= 7) && (tfp) < pixels) {
                if (fdata & (1 << (tfp & 7)) ) {
                    dbyte |= (1 << (dp)) ;
                } else {
                    dbyte &= ~(1 << (dp)) ;
                }

                
#line 665 "src/GLCD.c"
 
                if ((tfp & 7) == 7) {
                    fdata = GLCD_FontRead(GLCD_Font + index + page + j + width);

                    
#line 673 "src/GLCD.c"
 

                    if ((thielefont) && ((height - tfp) < 8)) {
                        fdata >>= (8 - (height & 7));
                    }

                    if (GLCD_FontColor == 0x00 )
                        fdata ^= 0xff;  
                }
                tfp++;
                dp++;
            }

            
#line 688 "src/GLCD.c"
 
            GLCD_WriteData(dbyte);
        }

        
#line 709 "src/GLCD.c"
 



        if ((dy & 7) || (pixels - p < 8)) {
            uint8_t mask = 0;

            do { GLCD_DoReadData(1); dbyte = GLCD_DoReadData(0); } while (0) ;

            if (dy & 7)
                mask |= (1 << (dy & 7))  - 1;

            if ((pixels - p) < 8)
                mask |= ~((1 << (pixels - p))  - 1);


            if (GLCD_FontColor == 0x00 )
                dbyte |= ~mask;
            else
                dbyte &= mask;

        } else {
            if (GLCD_FontColor == 0x00 )
                dbyte = 0xff;
            else
                dbyte = 0;
        }

        GLCD_WriteData(dbyte);

        
#line 742 "src/GLCD.c"
 

        p += 8 - (dy & 7);
    }


    
#line 756 "src/GLCD.c"
 

    GLCD_GotoXY(x + width + 1, y);

     

#line 763 "src/GLCD.c"

    return 1; 
}

void GLCD_Puts(const char *str)
{
    int x = GLCD_Coord.x;
    while (*str != 0) {
        if (*str == '\n') {
            GLCD_GotoXY(x, GLCD_Coord.y + GLCD_FontRead(GLCD_Font + 3 ));
        } else {
            GLCD_PutChar(*str);
        }
        str++;
    }
}

uint8_t GLCD_CharWidth(char c)
{
    uint8_t width = 0;
    uint8_t firstChar = GLCD_FontRead(GLCD_Font + 4 );
    uint8_t charCount = GLCD_FontRead(GLCD_Font + 5 );

    
    if (c >= firstChar && c < (firstChar + charCount)) {
        c -= firstChar;
        width = GLCD_FontRead(GLCD_Font + 6  + c) + 1;
    }

    return width;
}

uint16_t GLCD_StringWidth(const char *str)
{
    uint16_t width = 0;

    while (*str != 0) {
        width += GLCD_CharWidth(*str++);
    }

    return width;
}

void GLCD_CursorTo(uint8_t x, uint8_t y)
{ 
    GLCD_GotoXY(x * (GLCD_FontRead(GLCD_Font + 2 ) + 1),
            y * (GLCD_FontRead(GLCD_Font + 3 ) + 1));
}

void GLCD_GotoXY(uint8_t x, uint8_t y)
{
    uint8_t chip, cmd;

    if ((x > 128  - 1) || (y > 64  - 1)) 
        return;
    GLCD_Coord.x = x; 
    GLCD_Coord.y = y;

    if (y / 8 != GLCD_Coord.page) {
        GLCD_Coord.page = y / 8;
        cmd = 0xB8  | GLCD_Coord.page; 
        for (chip = 0; chip < 128  / 64 ; chip++) {
            do { do { do { LATBbits.LATB0  = chip; LATBbits.LATB1  = !chip; } while (0) ; TRISD  = 0xFF  ; LATBbits.LATB2  = 0 ; LATBbits.LATB3  = 1 ; LATBbits.LATB4  = 1 ; __delay_us(2) ; while (PORTD  & 0x80 ); LATBbits.LATB4  = 0 ; } while (0) ; LATBbits.LATB2  = 0 ; LATBbits.LATB3  = 0 ; TRISD  = 0x00  ; __delay_us(2) ; LATD  = cmd ; do { __delay_us(2) ; LATBbits.LATB4  = 1 ; __delay_us(2) ; LATBbits.LATB4  = 0 ; __delay_us(2) ; } while (0) ; __delay_us(2) ; __delay_us(2) ; LATD  = 0x00 ; } while (0) ;
        }
    }
    chip = GLCD_Coord.x / 64 ;
    x = x % 64 ;
    cmd = 0x40  | x;
    do { do { do { LATBbits.LATB0  = chip; LATBbits.LATB1  = !chip; } while (0) ; TRISD  = 0xFF  ; LATBbits.LATB2  = 0 ; LATBbits.LATB3  = 1 ; LATBbits.LATB4  = 1 ; __delay_us(2) ; while (PORTD  & 0x80 ); LATBbits.LATB4  = 0 ; } while (0) ; LATBbits.LATB2  = 0 ; LATBbits.LATB3  = 0 ; TRISD  = 0x00  ; __delay_us(2) ; LATD  = cmd ; do { __delay_us(2) ; LATBbits.LATB4  = 1 ; __delay_us(2) ; LATBbits.LATB4  = 0 ; __delay_us(2) ; } while (0) ; __delay_us(2) ; __delay_us(2) ; LATD  = 0x00 ; } while (0) ; 
}

void GLCD_Init(boolean invert)
{
     

    __delay_ms(10) ;

    LATBbits.LATB2  = 0 ;
    LATBbits.LATB3  = 0 ;
    LATBbits.LATB4  = 0 ;


    
#line 847 "src/GLCD.c"
 
    LATBbits.LATB5  = 0 ;
    __delay_ms(2) ;
    LATBbits.LATB5  = 1 ;
#line 852 "src/GLCD.c"

    
#line 856 "src/GLCD.c"
 
#line 864 "src/GLCD.c"
    __delay_ms(50) ;
#line 866 "src/GLCD.c"

    GLCD_Coord.x = 0;
    GLCD_Coord.y = 0;
    GLCD_Coord.page = 0;

    GLCD_Inverted = invert;

    for (uint8_t chip = 0; chip < 128  / 64 ; chip++) {
        __delay_ms(10) ;
        do { do { do { LATBbits.LATB0  = chip; LATBbits.LATB1  = !chip; } while (0) ; TRISD  = 0xFF  ; LATBbits.LATB2  = 0 ; LATBbits.LATB3  = 1 ; LATBbits.LATB4  = 1 ; __delay_us(2) ; while (PORTD  & 0x80 ); LATBbits.LATB4  = 0 ; } while (0) ; LATBbits.LATB2  = 0 ; LATBbits.LATB3  = 0 ; TRISD  = 0x00  ; __delay_us(2) ; LATD  = 0x3F  ; do { __delay_us(2) ; LATBbits.LATB4  = 1 ; __delay_us(2) ; LATBbits.LATB4  = 0 ; __delay_us(2) ; } while (0) ; __delay_us(2) ; __delay_us(2) ; LATD  = 0x00 ; } while (0) ; 
        do { do { do { LATBbits.LATB0  = chip; LATBbits.LATB1  = !chip; } while (0) ; TRISD  = 0xFF  ; LATBbits.LATB2  = 0 ; LATBbits.LATB3  = 1 ; LATBbits.LATB4  = 1 ; __delay_us(2) ; while (PORTD  & 0x80 ); LATBbits.LATB4  = 0 ; } while (0) ; LATBbits.LATB2  = 0 ; LATBbits.LATB3  = 0 ; TRISD  = 0x00  ; __delay_us(2) ; LATD  = 0xC0  ; do { __delay_us(2) ; LATBbits.LATB4  = 1 ; __delay_us(2) ; LATBbits.LATB4  = 0 ; __delay_us(2) ; } while (0) ; __delay_us(2) ; __delay_us(2) ; LATD  = 0x00 ; } while (0) ; 
    }
    
#line 886 "src/GLCD.c"
    __delay_ms(50) ;
#line 888 "src/GLCD.c"
    
    GLCD_ClearScreen(invert ? 0xFF  : 0x00 ); 
    GLCD_GotoXY(0, 0);
}

uint8_t GLCD_DoReadData(uint8_t first)
{
    uint8_t data, chip;

    chip = GLCD_Coord.x / 64 ;
    do { do { LATBbits.LATB0  = chip; LATBbits.LATB1  = !chip; } while (0) ; TRISD  = 0xFF  ; LATBbits.LATB2  = 0 ; LATBbits.LATB3  = 1 ; LATBbits.LATB4  = 1 ; __delay_us(2) ; while (PORTD  & 0x80 ); LATBbits.LATB4  = 0 ; } while (0) ;
    if (first) {
        if (GLCD_Coord.x % 64  == 0 && chip > 0) { 
            GLCD_GotoXY(GLCD_Coord.x, GLCD_Coord.y);
            do { do { LATBbits.LATB0  = chip; LATBbits.LATB1  = !chip; } while (0) ; TRISD  = 0xFF  ; LATBbits.LATB2  = 0 ; LATBbits.LATB3  = 1 ; LATBbits.LATB4  = 1 ; __delay_us(2) ; while (PORTD  & 0x80 ); LATBbits.LATB4  = 0 ; } while (0) ;
        }
    }
    LATBbits.LATB2  = 1 ; 
    LATBbits.LATB3  = 1 ; 

    LATBbits.LATB4  = 1 ; 
    __delay_us(2) ;

    data = PORTD ;

    LATBbits.LATB4  = 0 ;
    if (first == 0)
        GLCD_GotoXY(GLCD_Coord.x, GLCD_Coord.y);
    if (GLCD_Inverted)
        data = ~data;
    return data;
}

void GLCD_WriteData(uint8_t data)
{
    uint8_t displayData, yOffset, chip;
    
    

#line 930 "src/GLCD.c"

#line 935 "src/GLCD.c"

    if (GLCD_Coord.x >= 128 )
        return;
    chip = GLCD_Coord.x / 64 ;
    do { do { LATBbits.LATB0  = chip; LATBbits.LATB1  = !chip; } while (0) ; TRISD  = 0xFF  ; LATBbits.LATB2  = 0 ; LATBbits.LATB3  = 1 ; LATBbits.LATB4  = 1 ; __delay_us(2) ; while (PORTD  & 0x80 ); LATBbits.LATB4  = 0 ; } while (0) ;


    if (GLCD_Coord.x % 64  == 0 && chip > 0) { 
        GLCD_GotoXY(GLCD_Coord.x, GLCD_Coord.y);
    }

    LATBbits.LATB2  = 1 ; 
    LATBbits.LATB3  = 0 ; 
    TRISD  = 0x00  ; 

    yOffset = GLCD_Coord.y % 8;

    if (yOffset != 0) {
        
#line 957 "src/GLCD.c"
        do { GLCD_DoReadData(1); data = GLCD_DoReadData(0); } while (0) ;
#line 961 "src/GLCD.c"
        LATBbits.LATB2  = 1 ; 
        LATBbits.LATB3  = 0 ; 
        do { LATBbits.LATB0  = chip; LATBbits.LATB1  = !chip; } while (0) ;
#line 965 "src/GLCD.c"
        TRISD  = 0x00  ; 

        displayData |= data << yOffset;
        if (GLCD_Inverted)
            displayData = ~displayData;
        LATD  = displayData ; 
        do { __delay_us(2) ; LATBbits.LATB4  = 1 ; __delay_us(2) ; LATBbits.LATB4  = 0 ; __delay_us(2) ; } while (0) ; 

        
        GLCD_GotoXY(GLCD_Coord.x, GLCD_Coord.y + 8);

        do { GLCD_DoReadData(1); displayData = GLCD_DoReadData(0); } while (0) ;

#line 981 "src/GLCD.c"
        LATBbits.LATB2  = 1 ; 
        LATBbits.LATB3  = 0 ; 
        do { LATBbits.LATB0  = chip; LATBbits.LATB1  = !chip; } while (0) ;
#line 985 "src/GLCD.c"
        TRISD  = 0x00  ; 

        displayData |= data >> (8 - yOffset);
        if (GLCD_Inverted)
            displayData = ~displayData;
        LATD  = displayData ; 
        do { __delay_us(2) ; LATBbits.LATB4  = 1 ; __delay_us(2) ; LATBbits.LATB4  = 0 ; __delay_us(2) ; } while (0) ; 

        GLCD_GotoXY(GLCD_Coord.x + 1, GLCD_Coord.y - 8);
    } else {
        
        if (GLCD_Inverted)
            data = ~data;
        __delay_us(2) ;
        LATD  = data ; 
        do { __delay_us(2) ; LATBbits.LATB4  = 1 ; __delay_us(2) ; LATBbits.LATB4  = 0 ; __delay_us(2) ; } while (0) ; 
        GLCD_Coord.x++;
        
    }
}

void GLCD_DrawBitmap(const uint8_t * bitmap, uint8_t x, uint8_t y, uint8_t color)
{
    uint8_t width, height;
    uint8_t i, j;

    width = ReadPgmData(bitmap++);
    height = ReadPgmData(bitmap++);
    for (j = 0; j < height / 8; j++) {
        GLCD_GotoXY(x, y + (j * 8));
        for (i = 0; i < width; i++) {
            uint8_t displayData = ReadPgmData(bitmap++);
            if (color == 0xFF )
                GLCD_WriteData(displayData);
            else
                GLCD_WriteData(~displayData);
        }
    }
}

