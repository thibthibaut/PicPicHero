/* 
 * File:   music.h
 * Author: Vince
 *
 * Created on 25 novembre 2014, 17:52
 */

#ifndef MUSIC_H
#define	MUSIC_H

#ifdef	__cplusplus
extern "C" {
#endif


//Define notes
#define C 8
#define D 4
#define E 2
#define F 1
#define G 9
#define A 6
#define B 12
#define C2 5
#define Q 0 //Quiet

//Define length
#define qc 1
#define dc 2
#define cr 4
#define no 8
#define np 12 //noir pointée
#define bl 16
#define ro 32


#define TEMPO 1


  #define x 17 //total number of notes in song to be played - modify for specific song



    void play_music(void);

    void play_note(unsigned char n);

#ifdef	__cplusplus
}
#endif

#endif	/* MUSIC_H */

