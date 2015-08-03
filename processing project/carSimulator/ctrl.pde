boolean keyPress[] = new boolean[256];
void ctrlInit(){
  for(int i=0;i<256;i++)keyPress[i]=false;
}
void keyPressed(){
  keyPress[keyCode] = true;
}
void keyReleased(){
  keyPress[keyCode] = false;
}
