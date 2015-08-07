class v2{
  float x;
  float y;
  v2(float x,float y){
    this.x=x;
    this.y=y;
  }
}

v2 add(v2 a,v2 b){
  return new v2(a.x+b.x,a.y+b.y);
}
v2 sub(v2 a,v2 b){
  return new v2(a.x-b.x,a.y-b.y);
}
v2 mult(v2 a,float t){
  return new v2(a.x*t,a.y*t);
}
float lenOf(v2 a){
  return sqrt(a.x*a.x+a.y*a.y);
}

v2 min(v2 a,v2 b){
  return new v2(min(a.x,b.x),min(a.y,b.y));
}
v2 max(v2 a,v2 b){
  return new v2(max(a.x,b.x),max(a.y,b.y));
}

float range(float min,float max,float x){
  return min(min,max(max,x));
}

v2 range(v2 min,v2 max,v2 x){
  return min(min,max(max,x));
}
