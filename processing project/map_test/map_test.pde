void setup(){
  size(800,800);
  createBddb();
  noSmooth();
  for(int i=0;i<20;i++){
    for(int j=0;j<20;j++){
      map[i][j] = new block((int)random(4),15);
    }
  }
}

void draw(){
  drw();
}
