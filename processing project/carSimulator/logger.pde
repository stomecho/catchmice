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
    max += (ava-max) *0.001;
    if(d>max) max = d;
    if(max*multi<h*0.5 && multi<64 )multi*=2;
    else if(max*multi>h)multi*=0.5;
    
    data[inPoint] = d;
    inPoint = (inPoint+w-1)%w;
  }
  void draw(){
    fill(255,64);stroke(0,64);strokeWeight(2);
    rect(x,y,w,-h);
    fill(0); stroke(#12E3FC); strokeWeight(1);
    text(name+" "+nf(multi,1,2)+"X\nvalue= "+nf(data[(inPoint+1)%w],2,2),x,y+16);
    for(int i=0;i<w;i++){
      float f = data[(inPoint+1+i)%w] * multi;
      line(x+i,y,x+i,y-f);
    }
    stroke(100,255,100);strokeWeight(2);
    line(x,y-ava*multi,x+w,y-ava*multi);
    stroke(255,0,0); line(x,y-max*multi,x+w,y-max*multi);
  }
}