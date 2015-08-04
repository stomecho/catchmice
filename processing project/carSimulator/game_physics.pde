void update(){ 
  cowAI(c);
  if(second()%6<3) carAI(cclomen);
  else carAI(new cow(new v2(width/2, height), 0));
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
  if(cclomen.pos.y<=c.pos.y)cclomen.draw();
  c.draw();
  if(cclomen.pos.y>c.pos.y)cclomen.draw();
  if(!smode)for(logger l : logs) l.draw();
}
