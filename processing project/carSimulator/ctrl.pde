boolean keyPress[] = new boolean[256];
void ctrlInit(){
  for(int i=0;i<256;i++)keyPress[i]=false;
}
void keyPressed(){
  if(keyCode==('p'-32)) smode = !smode;
  if(keyCode==('o'-32)) fastMode = !fastMode;
  keyPress[keyCode] = true;
}
void keyReleased(){
  keyPress[keyCode] = false;
}