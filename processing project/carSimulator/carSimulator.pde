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
int frameTime = 0;


logger logs[] = new logger[5];

void setup() {
  frameRate(100);
  size(500, 500);
  frame.setResizable(true);
  ctrlInit();
  c.initTexture();
  cclomen.initTexture();
  background = loadImage("map2.jpg");
  imageMode(CENTER);
  
  logs[0] = new logger(20,100,150,80,"FPS",60);
  logs[1] = new logger(20,230,150,80,"delta time",1000/60);
  logs[2] = new logger(20,360,150,80,"car speed");
  logs[3] = new logger(20,490,150,80,"car velocity");
  logs[4] = new logger(20,630,200,100,"frame Time",1000/fps);
  
  pmillis = millis();
  frameTime=millis();
  
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
  
  if(0<updateCount&&updateCount<maxMultiframe*2) {
    render(); updateCount = 0; dropFrame = false; 
    logs[4].addlog(millis()-frameTime); frameTime=millis();
  }
  else dropFrame = true;
  
}
