void drw(){
  for(int i=0;i<20;i++){
    for(int j=0;j<20;j++){
      image( bddb[map[i][j].id].texture , i*32, j*32,32,32);
    }
  }
}
