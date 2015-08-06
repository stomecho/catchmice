PImage[] shade = new PImage[8];
boolean got = false;
void shade_init(){
  shade[0] = loadImage("gui/shade/top.png");
  shade[1] = loadImage("gui/shade/bottom.png");
  shade[2] = loadImage("gui/shade/left.png");
  shade[3] = loadImage("gui/shade/right.png");
  shade[4] = loadImage("gui/shade/top_left.png");
  shade[5] = loadImage("gui/shade/top_right.png");
  shade[6] = loadImage("gui/shade/bottom_left.png");
  shade[7] = loadImage("gui/shade/bottom_right.png");
}
class shadeCube{
  int x;
  int y;
  int w;
  int h;
  boolean over=false;
  shadeCube(int x,int y,int w,int h){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }
  
  void cheak(){
    if(!got&&abs(mouseX-x-w*0.5)<w*0.5&&abs(mouseY-y-h*0.5)<h*0.5){got=true; over=true;}
    else over = false;
  }
  void draw(float i){
    if(w>0&&h>0){
      
      if(fastMode){
        fill(0,32);noStroke();
        rect(x-3,y-3,w+6,h+6);
      }else{
        image(shade[0],x,y-5,w,5);
        image(shade[1],x,y+h,w,9);
        image(shade[2],x-7,y,7,h);
        image(shade[3],x+w,y,7,h);
        image(shade[4],x-7,y-5);
        image(shade[5],x+w,y-5);
        image(shade[6],x-7,y+h);
        image(shade[7],x+w,y+h);
      }
      
      noStroke();
      fill(250);
      if(over) {
        if(mousePressed) stroke(#2CFF4D);
        else stroke(#81E5FF);
      }
      rect(x,y,w,h);
      
    }
    if(w>100&&h>70){
      fill(128);
      text("NO."+nf(i*a,0,0)+"\nSYSTEM ALERT\nWINDOW HAS\nCREATED",x+10,y+20);
    }
    
  }
}
