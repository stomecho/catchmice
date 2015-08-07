int[][] map = new int[500][500];
int mw = 100;
int mh = 100;
player p1 = new player();
player p2 = new player();

void setup(){
  size(500,500);
  
  for(int i=0;i<mw;i++)for(int j=0;j<mh;j++)map[i][j] = (int)random(2);
  c.offset = new v2(100,100);
}

void draw(){
  background(0);
  c.dispW = width-200;
  c.dispH = height-200;
  //c.offset.x = mouseX;
  rect(c.offset,new v2(c.dispW,c.dispH));
  c.pos.x = mouseX*0.05;
  c.pos.y = mouseY*0.05;
  render();
}
