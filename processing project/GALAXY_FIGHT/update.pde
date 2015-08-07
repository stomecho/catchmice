void update(){
  if(keyPress[LEFT])p1.vel.x=-0.1;
  if(keyPress[RIGHT])p1.vel.x=0.1;
  if(p1.onGround&&keyPress[UP])p1.vel.y=-0.5;
  if(keyPress[DOWN])p1.vel.y+=0.01;
  
  phy();
  p1.upd();
  p2.upd();
  c.upd();
  
}
