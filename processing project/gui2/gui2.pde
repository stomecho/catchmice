shadeCube[] sc = new shadeCube[500];
shadeCube[] tsc = new shadeCube[500];
shadeCube[] osc = new shadeCube[500];
int a=100;
int t=0;
final static int T = 300;
final static int S = 15;
boolean fastMode = false;

void setup() {
  size(displayWidth, displayHeight);
  //noSmooth();
  
  shade_init();
  frame.setResizable(true);
  for (int i=0; i<a; i++) {
    sc[i] = new shadeCube(0, 0, 0, 0);
    osc[i] = new shadeCube(0, 0, 0, 0);
    tsc[i] = new shadeCube(0, 0, 0, 0);
  }
}

void keyPressed(){
  fastMode = !fastMode;
  if(fastMode) noSmooth();
  else smooth();
}

void draw() {
  background(64);
  fill(128);
  text("a demo of shaded cube by Hans Chiu",0,10);
  t++;
  for (int i=0; i<a; i++) {
    if ((t+i*T/a)%T==0) {
      osc[i] = tsc[i];
     if((t/T)%3<2){
        int x1 = (int)(random(width));
        int x2 = (int)(random(width));
        int y1 = (int)(random(height));
        int y2 = (int)(random(height));
        //tsc[i] = new shadeCube(min(x1,x2),min(y1,y2),max(x1,x2)-min(x1,x2),max(y1,y2)-min(y1,y2));
        tsc[i] = new shadeCube(min(x1, x2), min(y1, y2), (int)random(100, 300), (int)random(70, 200));
      }
      else tsc[i] = new shadeCube(osc[i].x, osc[i].y, 0, 0);
    }
  }
  for (int i=0; i<a; i++)sc[i].x = osc[i].x+(int)(vspeed(min(1, (float)((t+i*T/a)%T)/S))*(tsc[i].x-osc[i].x));
  for (int i=0; i<a; i++)sc[i].y = osc[i].y+(int)(vspeed(min(1, (float)((t+i*T/a)%T)/S))*(tsc[i].y-osc[i].y));
  for (int i=0; i<a; i++)sc[i].w = osc[i].w+(int)(vspeed(min(1, (float)((t+i*T/a)%T)/S))*(tsc[i].w-osc[i].w));
  for (int i=0; i<a; i++)sc[i].h = osc[i].h+(int)(vspeed(min(1, (float)((t+i*T/a)%T)/S))*(tsc[i].h-osc[i].h));
  got = false;
  for (int i=a-1; i>=0; i--)sc[i].cheak();
  strokeWeight(5);
  for (int i=0; i<a; i++)sc[i].draw((float)i/a);
  
}

