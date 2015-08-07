int tu(float x,float y){
   int x1=int(x),y1=int(y),fly=int(y)-10,r=1;
   if(x+0.8>x1+1)r=2;
  for(int i=0;i<r;i++)  
  for(int j=0;j<10;j++)
  if(map[x1+i][y1-j]){
    if(fly<y1-j)fly=y1-j;
  }
  return fly;
}
int td(float x,float y){
  int x1=int(x),y1=int(y),fly=int(y)+10,r=1;
   if(x+0.8>x1+1)r=2;
  for(int i=0;i<r;i++)  
  for(int j=0;j<10;j++)
  if(map[x1+i][y1+j]){
    if(fly>y1+j)fly=y1+j;
  }
  return fly;
}
int tl(float x,float y){
  int x1=int(x),y1=int(y),flx=int(x)-10,r=1;
  if(y+0.8>y1+1)r=2;
  for(int i=0;i<10;i++)  
  for(int j=0;j<r;j++)
  if(map[x1-i][y1+j]){
    if(flx<x1-i)flx=x1-i;
  }
  return flx;
}
int tr(float x,float y){
    int x1=int(x),y1=int(y),flx=int(x)+10,r=1;
     if(y+0.8>y1+1)r=2;
  for(int i=0;i<10;i++)  
  for(int j=0;j<r;j++)
  if(map[x1+i][y1+j]){
    if(flx>x1+i)flx=x1+i;
  }
  return flx;
}
