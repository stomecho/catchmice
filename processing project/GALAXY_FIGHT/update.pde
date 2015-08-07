void update(){
  if(keyPress[LEFT])p1.vel.x-=0.04;
  if(keyPress[RIGHT])p1.vel.x+=0.04;
  if(p1.onGround&&keyPress[UP])p1.vel.y=-0.3;
  if(keyPress[DOWN])p1.vel.y+=0.01;
  
  if(keyPress['a'-32])p2.vel.x-=0.04;
  if(keyPress['d'-32])p2.vel.x+=0.04;
  if(p2.onGround&&keyPress['w'-32])p2.vel.y=-0.3;
  if(keyPress['s'-32])p2.vel.y+=0.01;
  
  phy();
  p1.upd();
  p2.upd();
  
  
}

void safe(){
  c.upd();
  p1.safe();
  p2.safe();
}
