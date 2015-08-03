v2 par[] = new v2[9999];
int pari=0;
void initPar(){
  for(int i=0;i<9999;i++) par[i] = new v2(0,0,0,0,0);
}


void newp(float x,float y,float vx,float vy){
  par[pari] = new v2(x,y,vx,vy,(int)random(300,800));
  pari = (pari+1)%9999;
}

class v2{
  float x,vx;
  float y,vy;
  int t;
  v2(float x,float y,float vx,float vy,int t){
    this.x = x;
    this.y = y;
    this.vx=vx;
    this.vy=vy;
    this.t=t;
  }
  
  void upd(){
    
    
    
    if(t>0){
      vy+=0.2;
      x+=vx;
      y+=vy;
      vx*=0.98;
      vy*=0.98;
      t--;
    }
    /*
    if(x<0){
      x=0;
      vx*=-0.5;
    }
    if(x>=width){
      x=width;
      vx*=-0.5;
    }
    if(y<0){
      y=0;
      vy*=-0.5;
    }
    if(y>=height){
      y=height;
      vy*=-0.5;
    }
    */
  }
  
  void drw(){
    if(t>0){
      fill(255,0,0,128);
      rect(cx(x),cy(y),cs(2),cs(2));
    }
  }
}
