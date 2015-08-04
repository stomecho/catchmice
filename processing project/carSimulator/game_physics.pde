void update(){
  if (keyPress[UP])c.speed+=0.01;
  if (keyPress[DOWN])c.speed-=0.01;
  if (keyPress[LEFT])c.wheelAngle-=0.01;
  if (keyPress[RIGHT])c.wheelAngle+=0.01;
    if (keyPress[])cclomen.speed+=0.01;
  if (keyPress[])cclomen.speed-=0.01;
  if (keyPress[])cclomen.wheelAngle-=0.01;
  if (keyPress[])cclomen.wheelAngle+=0.01;
  c.run();
  cclomen.run();
}

void render(){
  background(0);
  c.draw();
  cclomen.draw();
  for(logger l : logs) l.draw();
}
