void update(){
  if(keyPress[LEFT])p1.vel.x-=0.04;
  if(keyPress[RIGHT])p1.vel.x+=0.04;
  if(p1.onGround&&keyPress[UP])p1.vel.y=-0.4;
  if(keyPress[DOWN])p1.vel.y+=0.01;
  
  if(keyPress['a'-32])p2.vel.x-=0.04;
  if(keyPress['d'-32])p2.vel.x+=0.04;
  if(p2.onGround&&keyPress['w'-32])p2.vel.y=-0.4;
  if(keyPress['s'-32])p2.vel.y+=0.01;
  
  phy();
  p1.upd();
  p2.upd();
  
  
}
float stw = 0;
void safe(){
  float ts;
  if((float)abs(pd.x/pd.y)>=(float)c.dispW/c.dispH){
    ts = abs(c.dispW*c.view/pd.x);
  }else{
    ts = abs(c.dispH*c.view/pd.y);
  }
  if(twoCam&&ts>20){
    if(lenOf(sub(c1.pos,c.rp(new v2(c.dispW*0.75,c.dispH*0.5))))<1&&lenOf(sub(c2.pos,c.rp(new v2(c.dispW*0.25,c.dispH*0.5))))<1)twoCam = false;
    
    c1.upd(c.rp(new v2(c.dispW*0.75,c.dispH*0.5)),c.s);
    c2.upd(c.rp(new v2(c.dispW*0.25,c.dispH*0.5)),c.s);
  }else{
    
    c1.upd(p1.pos,30);
    c2.upd(p2.pos,30);
  }
  
  if(ts>c.max)ts=c.max;
  else if(!twoCam&&ts<20)toTwoCam();
  c.upd(mult(add(p1.pos,p2.pos),0.5),ts);
  
  
  p1.safe();
  p2.safe();
}
