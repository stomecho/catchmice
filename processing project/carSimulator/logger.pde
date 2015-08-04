class logger{
  int x,y,w,h;
  String name;
  float data[];
  int inPoint;
  float multi = 1;
  float ava = 0;
  float sum = 0;
  float max = 0;
  float amount = 0;
  logger(int x,int y,int w,int h,String name){
    this.x=x; this.y=y; this.w=w; this.h=h;
    this.name = name;
    data = new float[w];
    for(float f : data) f = 0;
    inPoint = 0;
  }
  void addlog(float d){
    
    amount++;
    sum+=d;
    ava=sum/amount;
    max += (ava-max) *0.01;
    if(d>max) max = d;
    if(max*multi<h*0.5 && multi<64 )multi*=2;
    else if(max*multi>h)multi*=0.5;
    
    data[inPoint] = d;
    inPoint = (inPoint+w-1)%w;
  }
  void draw(){
    fill(255,64);stroke(#12E3FC,128);strokeWeight(1);
    rect(x,y,w,-h);
    fill(255); strokeWeight(1);
    text(name+" "+nf(multi,1,2)+"X\nvalue= "+nf(data[(inPoint+1)%w],2,2),x,y+16);
    for(int i=0;i<w;i++){
      float f = data[(inPoint+1+i)%w] ;
      if(f>ava) stroke(#FFB031,192);
      else if(f>max) stroke(#FF4231,192);
      else stroke(#12E3FC,192);
      line(x+i,y,x+i,y-f* multi);
    }
    stroke(256,128);strokeWeight(4);
    line(x,y-ava*multi,x+w,y-ava*multi);
    line(x,y-max*multi,x+w,y-max*multi);
    stroke(0,255,0,192);strokeWeight(2);
    line(x,y-ava*multi,x+w,y-ava*multi);
    stroke(255,0,0,192); line(x,y-max*multi,x+w,y-max*multi);
  }
}
