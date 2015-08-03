void update(){
  cameraX+=((b.x+d.x)*0.5-cameraX)*0.2;
  cameraY+=((b.y+d.y)*0.5-cameraY)*0.2;
  cameraS+=(width/(dist(b.x,b.y,d.x,d.y)+500)*0.5-cameraS)*0.1;
  /*
  for(int k=0;k<20;k++){
    float r=random(0,TWO_PI);
    float l=random(0,b.s/2);
    
    newp(b.x+cos(r)*l,b.y+sin(r)*l,b.vx+random(-1,1),b.vy+random(-1,1));
  }
  */
  if(press[UP]) b.vy-=1;
  if(press[DOWN]) b.vy+=10;
  if(press[LEFT]) b.vx-=1;
  if(press[RIGHT]) b.vx+=1;
  
  if(press['w'-32]) d.vy-=1;
  if(press['s'-32]) d.vy+=10;
  if(press['a'-32]) d.vx-=1;
  if(press['d'-32]) d.vx+=1;
  
  for(int i=0;i<a;i++){
    bs[i].upd();
    bs[i].o();
  }
  b.upd();
  d.upd();
  
  b.o();
  d.o();
  
  for(int i=0;i<a;i++){
    b.p(bs[i]);
    d.p(bs[i]);
    for(int j=i+1;j<a;j++){
      bs[i].p(bs[j]);
    }
  }
  if(b.p(d)==1)bb--;
  //b.c=color(sqrt(b.vx*b.vx+b.vy*b.vy),0,0);
}

void render(){
  background(128);
  fill(64);
  image(sword,cx(0),cy(0),cs(width),cs(height));
  for(int i=0;i<a;i++)bs[i].drw();
  
  b.drw();
  d.drw();
  fill(255);
  rect(cx(b.x)-cs(50),cy(b.y)-cs(b.s*0.75),cs(100),cs(10));
  rect(cx(d.x)-cs(50),cy(d.y)-cs(d.s*0.75),cs(100),cs(10));
  fill(255,20,20);
  rect(cx(b.x)-cs(50),cy(b.y)-cs(b.s*0.75),cs(bb),cs(10));
  rect(cx(d.x)-cs(50),cy(d.y)-cs(d.s*0.75),cs(db),cs(10));
  
  /*
  for(int i=0;i<9999;i++) par[i].upd();
  for(int i=0;i<9999;i++) par[i].drw();
  */
  
  hans.drw();
}
