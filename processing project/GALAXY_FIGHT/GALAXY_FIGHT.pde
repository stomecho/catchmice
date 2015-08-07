int[][] map = new int[500][500];
int mw = 100;
int mh = 100;
player p1 = new player();
player p2 = new player();

void setup(){
  size(500,500);
  for(int i=0;i<mw;i++)for(int j=0;j<mh;j++)map[i][j] = (int)random(2);
}

void draw(){
  println(c.pos.x);
}
