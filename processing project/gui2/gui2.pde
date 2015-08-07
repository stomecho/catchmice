shadeCube sc = new shadeCube(20,20,600,500);
int a=100;
int t=0;
boolean fastMode = false;

void setup() {
  size(displayWidth, displayHeight);
  //noSmooth();
  
  shade_init();
  frame.setResizable(true);
}

void keyPressed(){
  fastMode = !fastMode;
  if(fastMode) noSmooth();
  else smooth();
}

void draw() {
  background(64);
  fill(128);
  text("a demo of shaded cube by Hans Chiu",0,10);
  sc.draw();
  
}

