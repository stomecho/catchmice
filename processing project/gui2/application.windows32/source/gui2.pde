shadeCube[] sc = new shadeCube[500];
int a=100;
int t=0;
boolean fastMode = false;

void setup() {
  size(500, 500);
  //noSmooth();
  
  shade_init();
  frame.setResizable(true);
  for(int i=0;i<a;i++)sc[i] = new shadeCube(0,0,0,0);
  for(int i=0;i<a;i++)sc[i].setAnimation(20+i*2,20,20+i*2,20+i*2,600,500);
}

void keyPressed(){
  fastMode = !fastMode;
  if(fastMode) noSmooth();
  else smooth();
}

void draw() {
  dt();
  background(64);
  fill(128);
  text("a demo of shaded cube by Hans Chiu",0,10);
  
  for(int i=0;i<a;i++)sc[i].animation(t);
  for(int i=0;i<a;i++)sc[i].draw();
  t++;
}