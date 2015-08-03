PImage fighting;
class chiuhans{
  float x;
  float y;
  String message;
  chiuhans(String s){
    x=0;
    y=0;
    message = s;
  }
  void drw(){
    fill(255);
    image(fighting,x,y,50,50);
    text(message,x+50,y+20);
  }
}
