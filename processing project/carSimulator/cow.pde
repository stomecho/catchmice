class cow{
  v2 pos;
  v2v vel;
  float wheelAngle;
  float cowAngle;
  float speed;
  float tk;
  float nk;
  float len;
  float velHold;
  PImage texture[] = new PImage[36];
  cow(v2 pos,float angle){
    this.pos = pos;
    vel = new v2v(0,0);
    wheelAngle = radians(45);
    cowAngle = angle;
    speed = 0.1;
    tk = 0.045;
    nk = 0.5;
    len = 100;
    velHold=5;
    
  }
  void initTexture(){
    for(int i=1;i<=36;i++) texture[i-1] = loadImage("\\cowTexture\\"+nf(i,4)+".png");
  }
  void run(){
    cowAngle += wheelAngle * vel.projection(cowAngle).len * tk;
    cowAngle=(cowAngle+TWO_PI)%TWO_PI;
    wheelAngle*=0.98;
    vel = add(vel,new v2v(cowAngle,speed));
    if(vel.len<velHold)vel = sub(vel,mult(vel.projection(cowAngle+HALF_PI),nk));
    else vel = add(vel,mult(vel.projection(cowAngle+HALF_PI),nk*0.005));
    pos = add(pos,vel);
    speed*=0.99;
    vel.len*=0.9;
    
    if(pos.x<0){
      pos.x=0;
      vel = add(vel,new v2(abs(vel.x())*2,vel.y()*-0.5));
    }
    if(pos.x>width){
      pos.x=width;
      vel = add(vel,new v2(-abs(vel.x())*2,vel.y()*-0.5));
    }
    if(pos.y<0){
      pos.y=0;
      vel = add(vel,new v2(vel.x()*-0.5,abs(vel.y())*2));
    }
    if(pos.y>height*2){
      pos.y=height*2;
      vel = add(vel,new v2(vel.x()*-0.5,-abs(vel.y())*2));
    }
  }
  v2 head(){
    v2v l = new v2v(cowAngle,len*0.5);
    return add(pos,l);
  }
  v2 bottom(){
    v2v l = new v2v(cowAngle,len*0.5);
    return sub(pos,l);
  }
  void draw(){
    if(smode) image(texture[(int)((cowAngle)/( TWO_PI/36)+36-9)%36],pos.x,pos.y*0.5);
    else {
      image(texture[(int)((cowAngle)/( TWO_PI/36)+36-9)%36],pos.x,pos.y*0.5);
      noStroke();
      fill(0,128);
      rect(0,0,width,height);
      if(vel.len>velHold)fill(255,0,0,64);
      else fill(128,128);
      strokeWeight(2);stroke(255);
      line(head(),bottom());
      line(head(),add(head(),new v2v(cowAngle+wheelAngle*2,50)));
      ellipse(bottom(),20,20);
      ellipse(head(),50,50);
      
      strokeWeight(10);stroke(0,255,0,200);
      line(pos,add(pos,mult(vel.projection(cowAngle),10)));
      strokeWeight(10);stroke(0,255,0,200);
      line(pos,add(pos,mult(vel.projection(cowAngle+HALF_PI),10)));
      
    }
    
    
    
    
    if(smode) fill(0);
    else fill(255);
    text(  "vel = "+nf(vel.len,2,2)+" \nspeed = "+nf(speed,2,2)          
    ,pos.x+((pos.x<width-200)?30:-120),pos.y*0.5-40);
    
  }
}
