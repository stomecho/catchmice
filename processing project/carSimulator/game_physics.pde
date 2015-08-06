void update(){ 
  cowAI(c);
  /*
  if(second()%12<6) carAI(cclomen);
  else carAI(new cow(new v2(width/2,height), 0));
  */
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
  //background(64);
  if(fastMode) background(32);
  else image(background,width/2,height/2,width*1.5,height*1.5);
  if(!smode){
    noStroke();
    fill(0,128);
    rect(0,0,width,height);
  }
  if(cclomen.pos.y<=c.pos.y)cclomen.draw();
  c.draw();
  if(cclomen.pos.y>c.pos.y)cclomen.draw();
  if(!smode)for(logger l : logs) l.draw();
  if(hit){
    smash.play();
    smash.amp(hamp);
    hit=false;
  }
}
