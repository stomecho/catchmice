float cameraX=0;
float cameraY=0;
float cameraS=1.2;

float cx(float x){
  return cameraS*(x-cameraX)+width*0.5;
}

float cy(float y){
  return cameraS*(y-cameraY)+height*0.5;
}

float cs(float s){
  return s*cameraS;
}
