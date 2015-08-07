float dx=0;
float dy=0;

class player {
  v2 pos;
  v2 vel;
  player() {
    pos = new v2(20, 20);
    vel = new v2(0, 0);
  }
  void upd() {
    vel.y+=0.01;
    pos = add(pos, vel);
    if(map[(int)(pos.x+0.4)][(int)(pos.y+0.4)]==0){
      if (pos.y>td(pos)-0.8) {
        pos.y=td(pos)-0.8;
        vel.y*=-0.2;
      }
      if (pos.x<tl(pos)) {
        pos.x=tl(pos)+0.01;
        vel.x*=-0.2;
      }
      if (pos.y<tu(pos)) {
        pos.y=tu(pos)+0.01;
        vel.y*=-0.2;
      }
      if (pos.x>tr(pos)-0.8) {
        pos.x=tr(pos)-0.8;
        vel.x*=-0.2;
      }
    }else{
      vel.y=-0.2;
    }
  }
  
}

