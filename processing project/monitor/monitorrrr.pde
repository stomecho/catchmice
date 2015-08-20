class Monitor{
  int x,y;
  float[] hi=new float[100];
  float[] rhi=new float[100];
  String[] save=new String[1];
  int arg;
  int max;
  boolean sta=false;
  float maxi;
  int b=1; 
  Monitor(int x,int y){
  this.x=x;
  this.y=y;
  }
  void update(){
    pressed();
    average();
  }
  void add(float h){
    save[0]=String.valueOf(rhi[rhi.length-1]);
    saveStrings("監視器名稱log.txt",save);
    float[] dwaj=new float[100];
    for(int i=1;i<100;i++)
      dwaj[i]=rhi[i-1];
    for(int i=1;i<100;i++)
       rhi[i]=dwaj[i];
    rhi[0]=h;
    if(h>maxi)maxi=h;
    for(int i=0;i<100;i++)
      if(max<rhi[i])max=i;
    for(int i=0;i<100;i++)
      hi[i]=rhi[i]*100/maxi;
  }
  void draw(){
    stroke(#6FEBFF);
    fill(#C9F7FF);
    rect(x,y,100,100);
    noStroke();
    fill(#6EC3D1);
    for(int i=0;i<100/b;i++)
    rect(x+i*b,y+100-hi[i],b,hi[i]);
    //average
    stroke(#FFE967);
    line(x,y+100-arg,x+100,y+100-arg);
    stroke(#FF5E00);
    line(x,y+100-hi[max],x+100,y+100-hi[max]);
  }
  void pressed(){
    if(mousePressed)
      if(x<=mouseX&&x+100>mouseX&&y<=mouseY&&y+100>mouseY)
        sta=true;
    else sta=false;
  }
  void average(){
    for(int i=0;i<100/b;i++)
    arg+=hi[i];
    arg=arg/(100/b);
  }
}
