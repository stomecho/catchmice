PImage sword;

ball b = new ball(200,200,100,0.7,#28FACE,20000);
ball d = new ball(200,200,100,0.7,#FF820D,20000);
ball bs[] = new ball[6000];

chiuhans hans = new chiuhans("hi everyone i am hans XDD");

int a=10;//ball sum

int bb = 100;
int db = 100;

int pmillis = 0;
float deltaTime = 0;
int fps = 60;
int maxMultiframe = 10;
int updateCount = 0;

void setup(){
  noStroke();
  noSmooth();
  size(1000,400);
  frameRate(100);
  frame.setResizable(true);
  for(int i=0;i<a;i++){
    bs[i] = new ball(random(width),random(height),random(10,30),0.8,#58FA28,1);
  }
  initPar();
  sword = loadImage("sword.png");
  fighting = loadImage("FIGHTING.png");
  pmillis = millis();
}

void draw(){
  deltaTime+=millis()-pmillis;
  pmillis=millis();
  if(deltaTime>maxMultiframe*1000/fps) deltaTime = maxMultiframe*1000/fps;
  for(;deltaTime>1000/fps;deltaTime-=1000/fps) {update(); updateCount++; }
  if(0<updateCount&&updateCount<maxMultiframe*2) {render(); updateCount = 0; }
}

boolean press[] = new boolean[256];
void keyPressed(){
  press[keyCode] = true;
}

void keyReleased(){
  press[keyCode] = false;
}
