class logger {
  final static int snapw = 10;
  final int maxdata = 500;
  String name;
  int x, y, w, h;
  float[] data = new float[maxdata];
  int start = 0;
  int len = 0;
  float scale = 1;
  float rh = 0;
  float rscale = 0;

  float vmax = 0;
  float vava = 0;
  int count = 0;
  int mode = 0;

  boolean over = false;
  boolean overR = false;
  boolean overD = false;
  boolean rew = false;
  boolean reh = false;
  int mdx = -1;
  int mdy = -1;

  logger(String name, int x, int y, int w, int h) {
    saveStrings("data/log/"+name+"log.txt", new String[] {
      name+" log"
    }
    );
    this.name = name;
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }
  void draw() {
    over = x<=mouseX&&mouseX<x+w&&y<=mouseY&&mouseY<y+h;
    if (mousePressed) {
      if (mdx!=-1) {
        if (rew) w = w+x-mouseX;
        x = mouseX-mdx;
        if(!rew)snap(loggers);
      } else if (rew)w = mouseX-x;
      if (mdy!=-1) {
        if (reh) h = h+y-mouseY; 
        y = mouseY-mdy;
        if(!reh)snap(loggers);
      } else if (reh)h = mouseY-y;
    
      if (w>maxdata) {
        if(mdx!=-1)x+=w-maxdata;
        w=maxdata;
      }
      if (h>(int)(maxdata*0.618)) {
        if(mdy!=-1)y+=h-(int)(maxdata*0.618);
        h=(int)(maxdata*0.618);
      }
      if (w<50) {
        if(mdx!=-1)x-=50-w;
        w=50;
      }
      if (h<50) {
        if(mdy!=-1)y-=50-h;
        h=50;
      }
    } else {
      mdx = -1;
      mdy = -1;
      rew = false;
      reh = false;
    }


    fill(0,16);noStroke();
    rect(x-5, y-5, w+10, h+10);
    fill(255,250); 
    stroke(0, 64); 
    strokeWeight(1);
    rect(x, y, w, h);

    float trh = 0;
    float trscale = 0;

    switch(mode) {
    case 0:
      trh = 1;
      trscale = -scale;
      break;
    case 1:
      trh = 0;
      trscale = -scale;
      break;
    case 2:
      trh = 0.5;
      trscale = scale*-0.5;
      break;
    }
    
    rh += (trh-rh)*0.25;
    float ry = y+h*rh;
    rscale += (trscale-rscale)*0.25;
    
    fill(0, 128);
    noStroke();strokeWeight(1);
    for (int i=0; i<w&&i<maxdata; i++) {
      if ((start+maxdata-i)%maxdata%50==0) {
        stroke(0, 64);
        line(x+w-i, y, x+w-i, y+h);
        noStroke();
      }
      rect(x+w-i, ry, 1, data[(start+maxdata-i-1)%maxdata]*rscale);
    }
    float vmaxh = y+range(0,h,ry+vmax*rscale*((trh==0)?-1:1)-y);
    float vavah = y+range(0,h,ry+vava*rscale-y);
    
    fill(255, 0, 0, 192);
    rect(x, vmaxh, w, 2);
    rect(x, vmaxh, 50, 16);
    fill(0, 255, 0, 192);
    rect(x, vavah, w, 2);
    rect(x, vavah, 50, 16);
    
    fill(255);
    text(nf(vmax,0,2), x+5, vmaxh+12);
    fill(0);
    text(nf(vava,0,2), x+5, vavah+12);

    fill(255,64); stroke(0,64);
    if (rew&&mdx==-1) rect(x+w-2.5, y, 5, h);
    if (rew&&mdx!=-1) rect(x-2.5, y, 5, h);
    if (reh&&mdy!=-1) rect(x, y-2.5, w, 5);
    if (reh&&mdy==-1) rect(x, y+h-2.5, w, 5);
    
    fill(255,128);
    rect(x+2,y+2,w-4,16);
    
    fill(0); 
    text(name+" = "+nf(data[(start+maxdata-1)%maxdata],0,2), x+6, y+16);
    text(nf(scale,0,2)+"X", x+w-50, y+16);
  }

  void add(float f) {
    count++;
    if (len==maxdata) {
      savedata((start+maxdata-w)%maxdata, maxdata);
    }
    data[start]=f;
    len++;
    start=(start+1)%maxdata;

    vmax = 0;
    mode = -1;
    for (int i=0; i<w; i++) {
      if (data[(start+maxdata-i-1)%maxdata]<0) {
        if (mode == 0||mode == 2) mode = 2;
        else mode = 1;
      } else {
        if (mode == 1||mode == 2) mode = 2;
        else mode = 0;
      }
      vmax = max(vmax, abs(data[(start+maxdata-i-1)%maxdata]));
    }
    vava = (vava*count+f)/(count+1);

    if (vmax*scale*2<h&&scale*2<=64)scale*=2;
    if (vmax*scale>h&&scale*0.5>=0.01)scale*=0.5;
  }
  void savedata() {
    savedata(start, len);
  }
  void savedata(int s, int l) {
    String[] os = loadStrings("data/log/"+name+"log.txt");
    String[] ns = new String[os.length+l];
    for (int i=0; i<os.length; i++)ns[i]=os[i];
    for (int i=0; i<l; i++) {
      ns[os.length+i]=str(data[(s+maxdata-l+i)%maxdata]);
    }
    saveStrings("data/log/"+name+"log.txt", ns);
    len-=l;
  }

  boolean pressCheck() {
    if(x-snapw<=mouseX&&mouseX<x+w+snapw){
      if (abs(mouseY-y)<snapw) {
        reh = true;
        mdy = 0;
      } else if (abs(y+h-mouseY)<snapw) {
        reh = true;
      }
    }
    if(y-snapw<=mouseY&&mouseY<y+h+snapw){
      if (abs(mouseX-x)<snapw) {
        rew = true;
        mdx = 0;
      } else if (abs(x+w-mouseX)<snapw) {
        rew = true;
      }
    }
    if (over&&!rew&&!reh) {
      mdx = mouseX - x;
      mdy = mouseY - y;
      return true;
    }
    return reh||rew;
  }
  
  
  void snap(logger[] loggers){
    for(int i=0;i<loggers.length;i++){
      if(abs(x-loggers[i].x)<snapw*2) x = loggers[i].x;
      if(abs(y-loggers[i].y)<snapw*2) y = loggers[i].y;
    }
  }
}


float range(float min,float max,float f){
  return max(min,min(max,f));
}
