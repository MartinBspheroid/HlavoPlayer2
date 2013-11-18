
import ddf.minim.*;
import ddf.minim.signals.*;
import javax.sound.sampled.*;

Minim minim1;
Minim minim2;

AudioOutput out1;
AudioOutput out2;

AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;


Mixer.Info[] mixerInfo;

int len1, len2, len3;
int track = 1;

int hlava12 = 2;    // < --- vystup na zvukove karte pro hlavu 1 a 2 
int hlava3 = 3;    // <----- vystup na zvukove karte pro hlavu 3

void setup() {
  size(512, 256);
  minim1 = new Minim(this);
  minim2 = new Minim(this);
  //minim.debugOn();
  mixerInfo = AudioSystem.getMixerInfo();
  for (int i = 0; i < mixerInfo.length; i++) {

    println( i + " " + mixerInfo[i].getName());
  }
  
 Mixer mixer1 = AudioSystem.getMixer(mixerInfo[hlava12]);
 Mixer mixer2 = AudioSystem.getMixer(mixerInfo[hlava3]);
  minim1.setOutputMixer(mixer1);
  minim2.setOutputMixer(mixer2);
  out1 = minim1.getLineOut(Minim.STEREO);
  out2 = minim2.getLineOut(Minim.STEREO);
  
  
  
  
  
  player1 = minim1.loadFile("pc_celek_rozhovor.mp3");
  //player1.setPan(0);
  len1 = player1.length();
  player2 = minim2.loadFile("ucetni_celek_rozhovor.mp3");
  player2.setBalance(1);
  len2 = player2.length();
  
  player3 = minim2.loadFile("umelec_celek_rozhovor.mp3");
  len3 = player3.length();
  player3.setBalance(-1 );
  
  player1.play(); 
  player2.play();
  player3.play();
  
  println(player1.getControls( ));
  println("TRACK 1");
  
}

void draw() {
  background(0);
  stroke(255);
/*
if (track == 1 && !player1.isPlaying()) {
    
    setHead1();
    player1.rewind();
    player2.play();
    track = 2;
    println("TRACK 2");
  }
  if (track == 2 && !player2.isPlaying()) {
    
    setHead2();
    player2.rewind();
    player3.play();
    track = 3;
    println("TRACK 3");
  }
  if (track == 3 && !player3.isPlaying()) {
    
    setHead3();
    player3.rewind();
    player1.play();
    track = 1;
    println("TRACK 1");
  }
  
  */
  
  

  float progress1 = map(player1.position(), 0, len1, 10, width-10);
  float progress2 = map(player2.position(), 0, len2, 10, width-10);
  float progress3 = map(player3.position(), 0, len3, 10, width-10);


  line(10, 0, 10, 256);
  line(width-10, 0, width-10, 256);
  line(10, 32, progress1, 32);
  line(10, 64, progress2, 64);
  line(10, 96, progress3, 96);

  //println("Length: " + player1.length() + " Position: " + player1.position());
}

void setHead1() {
    
  
}

void setHead2() {
  
    
  
}

void setHead3() {

  
}

void stop() {

  minim1.stop();
  minim2.stop();
  super.stop();
}
