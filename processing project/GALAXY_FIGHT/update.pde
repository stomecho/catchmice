void update(){
  if(keyPress[LEFT])p1.vel.x-=0.05;
  if(keyPress[RIGHT])p1.vel.x+=0.05;
  if(keyPress[TOP])p1.vel.y-=0.05;
  if(keyPress[DOWN])p1.vel.y+=0.05;
  p1.upd();
  
}
