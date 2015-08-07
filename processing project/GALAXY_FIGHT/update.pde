void update(){
  if(keyPress[LEFT])p1.vel.x-=0.015;
  if(keyPress[RIGHT])p1.vel.x+=0.015;
  if(p1.onGround&&keyPress[UP])p1.vel.y-=0.3;
  if(keyPress[DOWN])p1.vel.y+=0.01;
  p1.upd();
  
}
