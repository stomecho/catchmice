v2 pd = new v2(0,0);
void phy(){
  pd = sub(p1.pos,p2.pos);
}


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
    vel = mult(vel,0.95);
  }
}

