void setup(){
  size(800,800);
  createBddb();
  noSmooth();
  for(int i=0;i<20;i++){
    for(int j=0;j<20;j++){
      int rd = (int)random(10);
      if(0<=rd&&rd<4&&j>10) rd=0;
      else if(4<=rd&&rd<7&&j>10&&j<15||random(5)<1) rd=1;
      else if(7<=rd&&rd<9) rd=2;
      else rd=3;
      map[i][j] = new block(rd,15);
    }
  }
}

void draw(){
  drw();
}
