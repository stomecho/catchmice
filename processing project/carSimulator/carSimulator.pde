import processing.sound.*;
car c = new car(new v2(100, 100), 0);
cow cclomen = new cow(new v2(900, 900), 0);
boolean smode = true;
boolean fastMode = false;
PImage background;

int fps = 60;
float renderDeltaTime = 0;
int pmillis = 0;
float deltaTime = 0;
int maxMultiframe = 10;
int updateCount = 0;
boolean dropFrame = false;
int frameTime = 0;

boolean hit=false;
float hamp=0;
SoundFile smash;

logger logs[] = new logger[4];

void setup() {
  frameRate(360);
  size(1024, 768);
  frame.setResizable(true);
  ctrlInit();
  c.initTexture();
  cclomen.initTexture();
  background = loadImage("map2.jpg");
  imageMode(CENTER);


  logs[0] = new logger(20, 100, 150, 80, "game FPS", fps);
  logs[1] = new logger(20, 230, 150, 80, "draw FPS", fps);
  logs[2] = new logger(20, 360, 150, 80, "real FPS", fps);
  logs[3] = new logger(20, 490, 150, 80, "multi frame count", 1);

  pmillis = millis();
  frameTime=millis();
  smash = new SoundFile(this, "sound/hit.mp3");
}

void draw() {

  deltaTime+=millis()-pmillis;
  pmillis=millis();
  float dT = deltaTime;

  if (deltaTime>maxMultiframe*1000/fps) deltaTime = maxMultiframe*1000/fps;
  while (deltaTime>=1000/fps) {
    update(); 
    updateCount++; 
    deltaTime-=1000/fps;
  }
  float uC = updateCount;


  if (deltaTime<=1000/fps&&0<updateCount&&updateCount<maxMultiframe*2) {
    renderDeltaTime = millis()-frameTime;
    frameTime=millis();
    render(); 
    updateCount = 0; 
    dropFrame = false;
  } else {
    dropFrame = true;
  }

  logs[0].addlog(uC*1000/dT);
  logs[1].addlog(uC*1000/renderDeltaTime);
  logs[2].addlog(1000/renderDeltaTime);
  logs[3].addlog(uC);
}
