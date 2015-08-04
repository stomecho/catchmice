void update(){
  if (keyPress[UP])c.speed+=0.01;
  if (keyPress[DOWN])c.speed-=0.01;
  if (keyPress[LEFT])c.wheelAngle-=0.01;
  if (keyPress[RIGHT])c.wheelAngle+=0.01;
  c.run();
  cclomen.run();
}

void render(){
  /*
  if(smode) image(background,width/2,height/2);
  else image(background,width/2,height/2);
  */
  background(255);
  c.draw();
  cclomen.draw();
  /*
  if(updateCount>1) {fill(255,0,0); text("fps: "+nf(rfps,3,2)+" phyx: "+updateCount+"X "+" drop frame",20,20);}
  else {fill(0); text("fps: "+nf(rfps,3,2),20,20);}
  */
  for(logger l : logs) l.draw();
}