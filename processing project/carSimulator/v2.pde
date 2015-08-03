class v2v{
  float angle;
  float len;
  v2v(float angle,float len){
    this.angle = angle;
    this.len = len;
  }
  void setX(float x){
    angle=angleOf(x,y());
    len=lenOf(x,y());
  }
  void setY(float y){
    angle=angleOf(x(),y);
    len=lenOf(x(),y);
  }
  void setXY(float x,float y){
    angle=angleOf(x,y);
    len=lenOf(x,y);
  }  
  v2 toV2(){
    return new v2(x(),y());
  }
  
  v2v projection(float a){
    return new v2v(a,cos(angle-a)*len);
  }
  float x(){
    return cos(angle)*len;
  }
  float y(){
    return sin(angle)*len;
  }
}

class v2{
  float x;
  float y;
  v2(float x,float y){
    this.x = x;
    this.y = y;
  }
  v2v toV2v(){
    return new v2v(angleOf(x,y),lenOf(x,y));
  }
}

v2v add(v2v a,v2v b){
  float x = a.x()+b.x();
  float y = a.y()+b.y();
  return new v2v(angleOf(x,y),lenOf(x,y));
}

v2v sub(v2v a,v2v b){
  float x = a.x()-b.x();
  float y = a.y()-b.y();
  return new v2v(angleOf(x,y),lenOf(x,y));
}

v2v mult(v2v a,float f){
  return new v2v(a.angle,a.len*f);
}

v2 add(v2 a,v2 b){
  return new v2(a.x+b.x,a.y+b.y);
}

v2 sub(v2 a,v2 b){
  return new v2(a.x-b.x,a.y-b.y);
}

v2 add(v2 a,v2v b){
  return new v2(a.x+b.x(),a.y+b.y());
}

v2 sub(v2 a,v2v b){
  return new v2(a.x-b.x(),a.y-b.y());
}

v2v add(v2v a,v2 b){
  return add(a,b.toV2v());
}

v2v sub(v2v a,v2 b){
  return sub(a,b.toV2v());
}

float angleOf(float x,float y){
  if(x==0&&y==0) return 0;
  else if(x>=0&&y>=0) return atan(y/x);
  else if(x>=0) return atan(y/x)+TWO_PI;
  else return atan(y/x)+PI;
}
float lenOf(float x,float y){
  return sqrt(x*x+y*y);
}

void line(v2 a,v2 b){
  line(a.x,a.y*0.5,b.x,b.y*0.5);
}

void ellipse(v2 p,float w,float h){
  ellipse(p.x,p.y*0.5,w,h*0.5);
}
