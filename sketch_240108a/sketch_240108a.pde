import java.io.*; 
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import processing.core.PImage;

//Global Variables
File musicFolder;
Minim minim;
int numberOfSongs = 1;
AudioPlayer[] playList = new AudioPlayer[numberOfSongs];
AudioMetaData[] playListMetaData = new AudioMetaData[numberOfSongs];
PFont generalFont;
color purple = #2C08FF;
PImage backgroundImage;
int currentSong = 0;

void setup() {
   //size() or fullScreen() choose between both > for ur display Option.
  fullScreen () ;
  //Display for Algorithm
  AXWidth = +displayWidth ;
  AXHeight = +displayHeight ;
  //Music File Load
  
  String Pathway = "../Music/MusicAndImage/" ;
  String extension = ".mp3"; //Type of the Music
  String pathsong = sketchPath (Pathway); //Where ur file song located at
  String pathEffect = sketchPath (SoundEffect); //Where ur soundEffects at
  musicFolder = new File ( pathsong ) ;
  int musicFileCount = musicFolder.list().length;
  File[] musicFiles = musicFolder.listFiles(); //String of Full Directies
  String[] songFilePathway = new String[musicFileCount];
  for ( int i = 0; i < musicFiles.length; i++ ) {
    songFilePathway[i] = ( musicFiles[i].toString() );
    //
}
 //Re-Execute songList Population, Simillar to DIVS type of Population >>
  numberOfSongs = musicFileCount ; //Placeholder Only, reexecute lines after fileCount Known
  songList = new AudioPlayer[numberOfSongs]; //song is now similar to song1
  printArray(songList);
  songListMetaData = new AudioMetaData[numberOfSongs]; //same as above
  for ( int i=0; i<musicFileCount; i++ ) {
    printArray(songList);
    songList[i]= minim.loadFile( songFilePathway[i] );
    songListMetaData[i] = songList[i].getMetaData();
  }//End Music Load
   //
   String Path = "../Music/MusicAndImage/" ;
   Images = "Anime1.jpg" ;
 
  //
   
  Imageing = Images ;
  BackgroundX2 = X1Width*0 ;
  BackgroundHeight = X1Height*0 ;
  BackgroundWidth = X1Width-1 ;
  BackgroundHeight = X1Height-1 ;
  //
  
  String  Anime1 = sketchPath ( Path +  Anime1 ) ;
  println ( "identify", PathImage ) ;
  Anime1Img =  loadImage (  Anime1Image ) ;
  
  //
  
  BackgroundX1 = X1Width*1/4 ;
  BackgroundY1 = X1Height*0 ;
  BackgroundWidthXT = X1Width/2 ;
  BackgroundHeightXT = X1Height*3/10 ;
  
  //
  
  BackgroundX3 = X1Width *1/2-( BackgroundWidthXW/2 ) ;
  BackgroundY3 = X1Height*7/10 ;
  BackgroundWidthXW  = X1Width*1/15 *X1Height/X1Width ;
  BackgroundHeightXW = X1Height*1/15 ;
  
  //
  
  ABX = X1Width*3/8 ;
  BBX = X1Width*5/8 ;
  AYWidth = BackgroundWidthXW ;
  AYHeight = BackgroundHeightXW ;
  GFWidth =  BackgroundWidthXW ;
  GFHeight = BackgroundHeightXW ;
  FCY = BackgroundY3 ;
  GCY = BackgroundY3  ;
  
  //
  
  ABoomBackG = X1Width*15/16 ;
  BBoomBackG = X1Height*0 ;
  BBWidth = X1Width*2/18 ;
  BBHeight = X1Height*2/18 ; 
  //End setup
  
  //
  
   void draw() {
  //NOte: Looping Function
  //Note: logical operators could be nested IFs
  if ( playList[0].isLooping() && playList[0].loopCount()!=-1 ) println("There are", playList[0].loopCount(), "loops left.");
  if ( playList[0].isLooping() && playList[0].loopCount()==-1 ) println("Looping Infinitely");
  if ( playList[0].isPlaying() && !playList[0].isLooping() ) println("Play Once");
  //
  //Debugging Fast Forward and Fast Rewind
  //println( "Song Position", song1.position(), "Song Length", song1.length() );
  //
  // songMetaData1.title()
  rect(width*1/4, height*0, width*1/2, height*3/10); //mistake
  fill(purple); //Ink
  textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  int size = 10; //Change this font size
  textFont(generalFont, size); //Change the number until it fits, largest font size
  text(playListMetaData[0].title(), width*1/4, height*0, width*1/2, height*3/10);
  fill(255); //Reset to white for rest of the program
} //End draw
  //
void keyPressed() {
  if (keyCode == LEFT) { n
    if (currentSong > 0) {
      currentSong--;
      playList[currentSong].play();
    }
  } else if (keyCode == RIGHT) { 
    if (currentSong < numberOfSongs - 1) {
      currentSong++;
      playList[currentSong].play();
    }
  } else if (keyCode == ' ') { 
    if (playList[currentSong].isPlaying()) {
      playList[currentSong].pause();
    } else {
      playList[currentSong].play();
    }
  } else if (keyCode == ENTER) { 
    playList[currentSong].play();
  } else if (key == 'E' || key == 'e') { 
    if (playList[currentSong].position() > playList[currentSong].length() * 0.8) {
      playList[currentSong].rewind();
    }
  } else if (key == 'L' || key == 'l') { 
    int loops = playList[currentSong].loopCount();
    if (loops == -1) {
      playList[currentSong].loop(0);
    } else {
      playList[currentSong].loop(loops + 1);
    }
  } else if (key == 'M' || key == 'm') { 
    if (playList[currentSong].isMuted()) {
      playList[currentSong].unmute();
    } else {
      playList[currentSong].mute();
    }
  } else if (key == 'F' || key == 'f') { 
    playList[currentSong].skip(1000);
  } else if (key == 'R' || key == 'r') { 
    playList[currentSong].skip(-1000);
  } else if (key == 'S' || key == 's') { 
    playList[currentSong].pause();
    playList[currentSong].rewind();
  } //End MOUSEPRESSED
//
//End YOUR MAIN PROGRAMMMMM!>>>>>>
