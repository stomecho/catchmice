class ball{
  float x,vx,px;
  float y,vy,py;
  float s;
  float tan;
  color c;
  float m;
  ball(float x,float y,float s,float tan,color c,float m){
    this.x=x;
    this.y=y;
    this.s=s;
    this.tan=tan;
    this.c=c;
    this.m=m;
    vx=0;px=0;
    vy=0;py=0;
  }
  void upd(){
    vy+=0.2;
    x+=vx;
    y+=vy;
    vx*=0.98;
    vy*=0.98;
    px=vx;
    py=vy;
  }
  void o(){
    if(x<0+s/2){
      x=0+s/2;
      vx*=-tan;
    }
    if(x>=width-s/2){
      x=width-s/2;
      vx*=-tan;
    }
    if(y<0+s/2){
      y=0+s/2;
      vy*=-tan;
    }
    if(y>=height-s/2){
      y=height-s/2;
      vy*=-tan;
    }
  }
  float p(ball q){
    float dx = q.x-x+q.px-px;
    float dy = q.y-y+q.py-py;
    float dd = sqrt(dx*dx+dy*dy);
    if(0<dd&&dd<(s+q.s)/2){
      
      float f=((s+q.s)/2-dd)*(tan+q.tan)*0.5;
      vx-=f*dx*(q.s+q.m)/dd/(s+m+q.s+q.m);
      vy-=f*dy*(q.s+q.m)/dd/(s+m+q.s+q.m);
      q.vx+=f*dx*(s+m)/dd/(s+m+q.s+q.m);
      q.vy+=f*dy*(s+m)/dd/(s+m+q.s+q.m);
      return 1;
    }
    return 0;
  }
  void drw(){
    stroke(255,32);
    strokeWeight(5);
    fill(c);
    ellipse(cx(x),cy(y),cs(s),cs(s));
    noStroke();
  }
}
