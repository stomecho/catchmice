float vspeed(float t){
  if(t<=0.5) return 2*t*t;
  else return 4*t-2*t*t-1;
}
