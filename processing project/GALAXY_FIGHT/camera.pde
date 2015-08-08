cam c = new cam();
cam c1 = new cam();
cam c2 = new cam();
boolean twoCam = false;

class cam{
  v2 pos;
  v2 tpos;
  v2 offset;
  float s;
  float ts;
  float k = 0.02;
  float view = 0.4;
  float max = 60;
  float dispW;
  float dispH;
  PGraphics display;
  cam(){
    offset = new v2(0,0);
    pos = new v2(0,0);
    tpos = new v2(0,0);
    s = 20;
    ts = 10;
  }
  void upd(v2 tpos,float ts){
    pos = add(pos,mult(sub(tpos,pos),k));
    
    s += (ts-s)*k;
  }
  v2 cp(v2 p){
    return add(mult(sub(p,pos),s),mult(new v2(dispW,dispH),0.5));
  }
  v2 rp(v2 p){
    return add(mult(sub(p,mult(new v2(dispW,dispH),0.5)),1f/s),pos);
  }
  v2 startPos(){
    return rp(new v2(0,0));
  }
  v2 endPos(){
    return rp(new v2(dispW,dispH));
  }
  float cs(float x){
    return s*x;
  }
  void draw(){
    
    display=createGraphics((int)dispW,(int)dispH);
    display.beginDraw();
    display.noStroke();
    v2 rsp = range(new v2(0,0),new v2(mw,mh),startPos());
    v2 rep = range(new v2(0,0),new v2(mw,mh),endPos());
    rep = add(rep,new v2(1,1));
    for(int i=(int)rsp.x;i<(int)rep.x;i++)
    for(int j=(int)rsp.y;j<(int)rep.y;j++){
      switch(map[i][j]){
        case 1:display.fill(255);break;
        default: display.fill(128);break;
      }
      rect(new v2(i,j),new v2(1,1));
    }
    display.fill(0,255,0);
    rect(p1.pos,new v2(0.8,0.8));
    display.fill(255,0,0);
    rect(p2.pos,new v2(0.8,0.8));
    display.strokeWeight(10);
    display.stroke(0,128);
//    line(add(p1.pos,new v2(0.4,0.4)),new v2(p1.pos.x+0.4,tu(p1.pos)));
//    line(add(p1.pos,new v2(0.4,0.4)),new v2(p1.pos.x+0.4,td(p1.pos)));
//    line(add(p1.pos,new v2(0.4,0.4)),new v2(tl(p1.pos),p1.pos.y+0.4));
//    line(add(p1.pos,new v2(0.4,0.4)),new v2(tr(p1.pos),p1.pos.y+0.4));
    display.endDraw();
    image(display,offset.x,offset.y);
    
  }
  void rect(v2 p,v2 s){
    p = cp(p);
    s = mult(s,cs(1));
    display.rect(p.x,p.y,s.x,s.y);
  }
  void line(v2 a,v2 b){
    a = cp(a);
    b = cp(b);
    display.line(a.x,a.y,b.x,b.y);
  }
  void ellipse(v2 p,v2 s){
    p = cp(p);
    s = mult(s,cs(1));
    display.ellipse(p.x,p.y,s.x,s.y);
  }
}


void toTwoCam(){
  c1.s=c.s;
  c2.s=c.s;
  c1.pos=c.rp(new v2(c.dispW*0.75,c.dispH*0.5));
  c2.pos=c.rp(new v2(c.dispW*0.25,c.dispH*0.5));
  twoCam = true;
}
