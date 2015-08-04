car c = new car(new v2(100, 100), 0);
cow cclomen = new cow(new v2(900, 900), 0);
boolean smode = true;
PImage background;

int fps = 60;
float rfps = 0;
int pmillis = 0;
float deltaTime = 0;
int maxMultiframe = 10;
int updateCount = 0;
boolean dropFrame = false;

logger logs[] = new logger[4];

void setup() {
  frameRate(100);
  size(500, 500);
  frame.setResizable(true);
  ctrlInit();
  c.initTexture();
  cclomen.initTexture();
  background = loadImage("map1.png");
  imageMode(CENTER);
  pmillis = millis();
  
  logs[0] = new logger(20,100,100,50,"FPS");
  logs[1] = new logger(20,200,100,50,"delta time");
  logs[2] = new logger(20,300,100,50,"car speed");
  logs[3] = new logger(20,400,100,50,"car velocity");
}

void draw(){
  
  deltaTime+=millis()-pmillis;
  rfps = 1000/deltaTime;
  pmillis=millis();
  
  if(deltaTime>maxMultiframe*1000/fps) deltaTime = maxMultiframe*1000/fps;
  for(;deltaTime>=1000/fps;deltaTime-=1000/fps) {update(); updateCount++; }
  
  logs[0].addlog(rfps);
  logs[1].addlog(deltaTime);
  logs[2].addlog(abs(c.speed));
  logs[3].addlog(c.vel.len);
  
  if(0<updateCount&&updateCount<maxMultiframe*2) {render(); updateCount = 0; dropFrame = false;}
  else dropFrame = true;
  
}