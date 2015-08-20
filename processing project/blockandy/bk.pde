class bk {
  int x, y, c=0;
  boolean in;
  boolean in2;
  boolean sta;
  boolean make;
  color a;
  bk(int x, int y) {
    this.x=x;
    this.y=y;
  }
  void update(ArrayList<bk> block) {
    sta=x-50<=mouseX&x+50>=mouseX&y-50<=mouseY&y+50>=mouseY;
    if (mousePressed) {
      if(c==0){
        in=sta;
        c=1;
      }
      else
        if(in!=sta)in2=sta;            
      if(mouseButton == LEFT){
        if(in==true&&in2==false)a=#BAFF95;
        if(in==false&&in2==true)a=#FFA390;
      }
      if(mouseButton == RIGHT){
        if (in)make=true;
        else a=255;
        if(sta)a=#86DAFF;
      }
    }
    else{
      a=255;
      c=0;
      in=false;
      in2=false;
      if(make){
          boolean remove=false;
          for(int i=0;i<block.size();i++)
            if(block.get(i).sta==true){
              block.remove(i);
              remove=true;
            }
          if(remove==false){
            block.add(new bk(mouseX,mouseY));
          }
        make=false;
      }
    }
  }
  void draw() {
    stroke(a-30);
    fill(a);
    if(make)rect(mouseX-50,mouseY-50,100,100);
    rect(x-50,y-50,100,100);
  }
}

