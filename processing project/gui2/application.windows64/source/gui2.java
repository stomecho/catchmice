import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class gui2 extends PApplet {

shadeCube[] sc = new shadeCube[500];
int a=100;
int t=0;
boolean fastMode = false;

public void setup() {
 
  //noSmooth();
  
  shade_init();
  frame.setResizable(true);
  for(int i=0;i<a;i++)sc[i] = new shadeCube(0,0,0,0);
  for(int i=0;i<a;i++)sc[i].setAnimation(20+i*2,20,20+i*2,20+i*2,600,500);
}

public void keyPressed(){
  fastMode = !fastMode;
  if(fastMode) noSmooth();
  else smooth();
}

public void draw() {
  dt();
  background(64);
  fill(128);
  text("a demo of shaded cube by Hans Chiu",0,10);
  
  for(int i=0;i<a;i++)sc[i].animation(t);
  for(int i=0;i<a;i++)sc[i].draw();
  t++;
}
public void dt(){
  got = false;
  for(int i=a-1;i>=0;i--) sc[i].cheak();
}
PImage[] shade = new PImage[8];
boolean got = false;
public void shade_init(){
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
  
  public void cheak(){
    if(!got&&abs(mouseX-x-w*0.5f)<w*0.5f&&abs(mouseY-y-h*0.5f)<h*0.5f){got=true; over=true;}
    else over = false;
  }
  public void setAnimation(int st,int dt,int x,int y,int w,int h){
    this.st=st;
    this.dt=dt;
    ox=tx; tx=x;
    oy=ty; ty=y;
    ow=tw; tw=w;
    oh=th; th=h;
    pg = createGraphics(w,h);
  }
  public void animation(int t){
    if(st<t&&t-st<dt){
      x=ox+(int)(vspeed(max(0,min(1,(float)(t-st)/dt)))*(tx-ox));
      y=oy+(int)(vspeed(max(0,min(1,(float)(t-st)/dt)))*(ty-oy));
      w=ow+(int)(vspeed(max(0,min(1,(float)(t-st)/dt)))*(tw-ow));
      h=oh+(int)(vspeed(max(0,min(1,(float)(t-st)/dt)))*(th-oh));
    }
  }
  public void draw(){    
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
          stroke(0xff2CFF4D);
          press = true;
        }
        else stroke(0xff81E5FF);
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
public float vspeed(float t){
  if(t<=0.5f) return 2*t*t;
  else return 4*t-2*t*t-1;
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "gui2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
