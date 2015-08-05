
import processing.sound.*;
AudioIn in;

import processing.sound.*;
SoundFile file;

void setup() {
  size(640, 360);
  background(255);
    
  // Load a soundfile from the /data folder of the sketch and play it back
  file = new SoundFile(this, "SMASH! - Starbomb MUSIC VIDEO animated by Studio Yotta.mp3");
  file.play();
}      

void draw() {
  background(0);
  
  ellipse(file.frames(),100,10,10);
  println(file.frames()+" "+file.duration());
  
}

boolean keyPress[] = new boolean[256];
void keyreset(){
  for(int i=0;i<256;i++)keyPress[i]=false;
}
void keyPressed(){
  keyPress[keyCode] = true;
}
void keyReleased(){
  keyPress[keyCode] = false;
}