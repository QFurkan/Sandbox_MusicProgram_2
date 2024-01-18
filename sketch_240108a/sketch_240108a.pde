import java.io.*; 
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

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
  size(800, 600);
  backgroundImage = loadImage("background.jpg");  file name
  String relativePathway = "FreeWare Music/MusicDownload/";
  String absolutePath = sketchPath(relativePathway);
  musicFolder = new File(absolutePath);
  int musicFileCount = musicFolder.list().length;
  println("File Count of the Music Folder", musicFileCount);
  File[] musicFiles = musicFolder.listFiles();
  String[] songFilePathway = new String[musicFileCount];
  for (int i = 0; i < musicFiles.length; i++) {
    songFilePathway[i] = (musicFiles[i].toString());
  }
  numberOfSongs = musicFileCount;
  playList = new AudioPlayer[numberOfSongs];
  playListMetaData = new AudioMetaData[numberOfSongs];
  minim = new Minim(this);
  for (int i = 0; i < musicFileCount; i++) {
    playList[i] = minim.loadFile(songFilePathway[i]);
    playListMetaData[i] = playList[i].getMetaData();
  }
  generalFont = createFont("Harrington", 55);
  playList[0].play();
}

void draw() {
  background(backgroundImage);
  if (playList[currentSong].isPlaying()) {
    fill(purple);
    textAlign(CENTER, CENTER);
    int size = 10;
    textFont(generalFont, size);
    text(playListMetaData[currentSong].title(), width / 2, height / 2);
  } else {
    fill(255);
    textAlign(CENTER, CENTER);
    int size = 10;
    textFont(generalFont, size);
    text("Paused: " + playListMetaData[currentSong].title(), width / 2, height / 2);
  }
}

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
  }
}
