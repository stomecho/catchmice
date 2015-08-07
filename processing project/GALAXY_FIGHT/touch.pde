int tu(v2 pa){
   int x1=int(pa.x),y1=int(pa.y),fly=int(pa.y)-3,r=1;
     if(pa.x+0.8>x1+1)r=2;
       for(int i=0;i<r;i++)  
        for(int j=0;j<3;j++)
      if(map[x1+i][y1-j]==1){
    if(fly<y1-j)fly=y1-j;
  }
  return fly;
}
int td(v2 pa){
  int x1=int(pa.x),y1=int(pa.y),fly=int(pa.y)+6,r=1;
   if(pa.x+0.8>x1+1)r=2;
    for(int i=0;i<r;i++)  
      for(int j=0;j<6;j++)
    if(map[x1+i][y1+j]==1){
   if(fly>y1+j)fly=y1+j;
  }
  return fly;
}
int tl(v2 pa){
  int x1=int(pa.x),y1=int(pa.y),flx=int(pa.x)-3,r=1;
   if(pa.y+0.8>y1+1)r=2;
     for(int i=0;i<3;i++)  
       for(int j=0;j<r;j++)
      if(map[x1-i][y1+j]==1){
    if(flx<x1-i)flx=x1-i;
  }
  return flx;
}
int tr(v2 pa){
    int x1=int(pa.x),y1=int(pa.y),flx=int(pa.x)+3,r=1;
     if(pa.y+0.8>y1+1)r=2;
      for(int i=0;i<3;i++)  
        for(int j=0;j<r;j++)
      if(map[x1+i][y1+j]==1){
    if(flx>x1+i)flx=x1+i;
  }
  return flx;
}
