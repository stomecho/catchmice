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
    return add(add(mult(sub(p,pos),s),mult(new v2(dispW,dispH),0.5)),offset);
  }
  v2 rp(v2 p){
    return add(mult(sub(sub(p,offset),mult(new v2(dispW,dispH),0.5)),1f/s),pos);
  }
  v2 startPos(){
    return rp(offset);
  }
  v2 endPos(){
    return rp(add(new v2(dispW,dispH),offset));
  }
  float cs(float x){
    return s*x;
  }
}
