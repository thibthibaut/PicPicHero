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



  #define x 28 //total number of notes in song to be played - modify for specific song



    void play_music(void);

    void play_note(unsigned char n);

#ifdef	__cplusplus
}
#endif

#endif	/* MUSIC_H */

