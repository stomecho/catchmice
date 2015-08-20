boolean keyPress[] = new boolean[256];
void keyreset(){
  for(int i=0;i<256;i++)keyPress[i]=false;
}
void keyPressed(){
//  if(keyPress[BACKSPACE])s=s.substring(0,s.length()-2);
//   if(keyPress[ENTER])myClient.write(s);
   myClient.write(char(keyCode));
  s+=char(keyCode+32);
  keyPress[keyCode] = true;
}
void keyReleased(){
  keyPress[keyCode] = false;
}
