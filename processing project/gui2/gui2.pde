shadeCube[] sc = new shadeCube[500];
int a=10;
int t=0;
boolean fastMode = false;

void setup() {
  size(500, 500);
  //noSmooth();
  
  shade_init();
  frame.setResizable(true);
  for(int i=0;i<a;i++)sc[i] = new shadeCube(0,0,0,0);
  for(int i=0;i<a;i++)sc[i].setAnimation(20+i*10,20,20+i*5,20+i*5,600,500);
}

void keyPressed(){
  /*fastMode = !fastMode;
  if(fastMode) noSmooth();
  else smooth();*/
  for(int i=0;i<a;i++)sc[i].setAnimation(t+i*2,100,20+140*i,height-60,120,30);
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
