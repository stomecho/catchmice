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
  int x,ox,tx;
  int y,oy,ty;
  int w,ow,tw;
  int h,oh,th;
  int st,dt;
  boolean over=false;
  PGraphics pg;
  boolean press;
  int dmx;
  int dmy;
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
  void setAnimation(int st,int dt,int x,int y,int w,int h){
    this.st=st;
    this.dt=dt;
    ox=tx; tx=x;
    oy=ty; ty=y;
    ow=tw; tw=w;
    oh=th; th=h;
    pg = createGraphics(w,h);
  }
  void animation(int t){
    if(st<t&&t-st<dt){
      x=ox+(int)(vspeed(max(0,min(1,(float)(t-st)/dt)))*(tx-ox));
      y=oy+(int)(vspeed(max(0,min(1,(float)(t-st)/dt)))*(ty-oy));
      w=ow+(int)(vspeed(max(0,min(1,(float)(t-st)/dt)))*(tw-ow));
      h=oh+(int)(vspeed(max(0,min(1,(float)(t-st)/dt)))*(th-oh));
    }
  }
  void draw(){    
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
      fill(250);strokeWeight(5);
      if(over) {
        if(mousePressed) {
          if(!press){
            dmx = mouseX-x;
            dmy = mouseY-y;
          }
          stroke(#2CFF4D);
          press = true;
        }
        else stroke(#81E5FF);
      }
      if(mousePressed){
        if(press){
          x = mouseX-dmx;
          y = mouseY-dmy;
        }
      }else{
        press = false;
      }
      rect(x,y,w,h);
      image(pg,x,y,w,h);
    }
    
  }
}