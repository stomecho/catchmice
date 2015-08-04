void update(){ 
  
  if (keyPress[UP])c.speed+=0.01;
  if (keyPress[DOWN])c.speed-=0.01;
  if (keyPress[LEFT])c.wheelAngle-=0.01;
  if (keyPress[RIGHT])c.wheelAngle+=0.01;
  if (keyPress['w'-32])cclomen.speed+=0.01;
  if (keyPress['s'-32])cclomen.speed-=0.01;
  if (keyPress['a'-32])cclomen.wheelAngle-=0.01;
  if (keyPress['d'-32])cclomen.wheelAngle+=0.01;
  colDet();
  c.run();
  cclomen.run();
}

void render(){
  background(0);
  if(!smode){
    noStroke();
    fill(0,128);
    rect(0,0,width,height);
  }
  c.draw();
  cclomen.draw();
  if(!smode)for(logger l : logs) l.draw();
}
