float dx=0;
float dy=0;

class player {
  v2 pos;
  v2 vel;
  boolean onGround = false;
  player() {
    pos = new v2(20, 20);
    vel = new v2(0, 0);
  }
  void upd() {
    vel.y+=0.01;
    pos = add(pos, new v2(0,vel.y));
    if(vel.y<0&&map[(int)(pos.x)][(int)(pos.y)]!=0||map[(int)(pos.x+0.8)][(int)(pos.y)]!=0){pos.y=floor(pos.y+1)+0.001; vel.y*=-0.2;}
    if(vel.y>0&&map[(int)(pos.x)][(int)(pos.y+0.8)]!=0||map[(int)(pos.x+0.8)][(int)(pos.y+0.8)]!=0){onGround=true; pos.y=floor(pos.y)+0.199; vel.y*=-0.2; vel.x*=0.98;}
    else onGround = false;
    pos = add(pos, new v2(vel.x,0));
    if(vel.x<0&&map[(int)(pos.x)][(int)(pos.y)]!=0||map[(int)(pos.x)][(int)(pos.y+0.8)]!=0){pos.x=floor(pos.x+1)+0.001; vel.x*=-0.2;}
    if(vel.x>0&&map[(int)(pos.x+0.8)][(int)(pos.y)]!=0||map[(int)(pos.x+0.8)][(int)(pos.y+0.8)]!=0){pos.x=floor(pos.x)+0.199; vel.x*=-0.2;}
    /*
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
      vel.y=-0.03;
    }
    */
    vel = mult(vel,0.98);
  }
  
}

