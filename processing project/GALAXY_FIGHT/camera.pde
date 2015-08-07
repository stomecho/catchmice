cam c = new cam();

class cam{
  v2 pos;
  v2 tpos;
  v2 offset;
  float s;
  float ts;
  float k = 0.15;
  float view = 0.6;
  float max = 60;
  float dispW;
  float dispH;
  PGraphics display;
  cam(){
    offset = new v2(0,0);
    pos = new v2(0,0);
    tpos = new v2(0,0);
    s = 20;
    ts = 20;
  }
  void upd(){
    tpos = mult(add(p1.pos,p2.pos),0.5);
    pos = add(pos,mult(sub(tpos,pos),k));
    if((float)dx/dy>=(float)dispW/dispH){
      ts = dispW*view/dx;
    }else{
      ts = dispH*view/dy;
    }
    if(ts>max)ts=max;
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
    display.fill(255);
    display.stroke(0);
    v2 rsp = range(new v2(0,0),new v2(mw,mh),c.startPos());
    v2 rep = range(new v2(0,0),new v2(mw,mh),c.endPos());
    rep = add(rep,new v2(1,1));
    println(rsp.x,rsp.y,rep.x,rep.y);
    for(int i=(int)rsp.x;i<(int)rep.x;i++)
    for(int j=(int)rsp.y;j<(int)rep.y;j++){
      v2 p = c.cp(new v2(i,j));
      v2 s = mult(new v2(1,1),c.cs(1));
      display.rect(p.x,p.y,s.x,s.y);
    }
    display.endDraw();
    image(display,offset.x,offset.y);
  }
}
