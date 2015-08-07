int[][] map = new int[500][500];
int mw = 100;
int mh = 100;
player p1 = new player();
player p2 = new player();

void setup(){
  size(500,500);
  frame.setResizable(true);
  for(int i=0;i<mw;i++)for(int j=0;j<mh;j++)map[i][j] = (int)random(2);
  c.offset = new v2(0,0);
}

void draw(){
  background(0);
  c.dispW = width;
  c.dispH = height;
//  c.pos.x = mouseX*0.05;
//  c.pos.y = mouseY*0.05;
  p1.pos = new v2(mouseX*0.01+5,mouseY*0.01+5);
  p2.pos = new v2(mouseX*0.01+5,mouseY*0.01+5);
  render();
}
