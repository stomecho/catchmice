int[][] map = new int[500][500];
int mw = 100;
int mh = 100;
player p1 = new player();
player p2 = new player();


int fps = 60;
float renderDeltaTime = 0;
int pmillis = 0;
float deltaTime = 0;
int maxMultiframe = 10;
int updateCount = 0;
boolean dropFrame = false;
int frameTime = 0;

logger logs[] = new logger[4];

void setup(){
  noSmooth();
  frameRate(240);
  size(500,500);
  frame.setResizable(true);
  for(int i=0;i<mw;i++)for(int j=0;j<mh;j++)map[i][j] = (int)(random(5)/3);
  c.offset = new v2(0,0);
  
  logs[0] = new logger(20, 100, 150, 80, "game FPS", fps);
  logs[1] = new logger(20, 230, 150, 80, "draw FPS", fps);
  logs[2] = new logger(20, 360, 150, 80, "real FPS", fps);
  logs[3] = new logger(20, 490, 150, 80, "multi frame count", 1);
}

void draw(){
  c.dispW = width;
  c.dispH = height;
  
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
