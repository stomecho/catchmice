v2 pd = new v2(0,0);
void phy(){
  pd = sub(p1.pos,p2.pos);
}


class player {
  v2 pos,ppos,rpos;
  v2 vel;
  boolean onGround = false;
  player() {
    ppos = new v2(5,5);
    rpos = new v2(5,5);
    pos = new v2(5, 5);
    vel = new v2(0, 0);
  }
  void upd() {
    if(abs(vel.x)*3>=1)vel.x/= abs(vel.x)*3;
    if(abs(vel.y)*3>=1)vel.y/= abs(vel.y)*3;
    ppos=rpos;
    vel.y+=0.03;
    rpos = add(rpos, new v2(0,vel.y*2));
    if(vel.y<0&&map[(int)(rpos.x)][(int)(rpos.y)]!=0||map[(int)(rpos.x+0.8)][(int)(rpos.y)]!=0){rpos.y=floor(rpos.y+1)+0.001; vel.y*=-0.2;}
    else if(vel.y>0&&map[(int)(rpos.x)][(int)(rpos.y+0.8)]!=0||map[(int)(rpos.x+0.8)][(int)(rpos.y+0.8)]!=0){onGround=true; rpos.y=floor(rpos.y)+0.19; vel.y*=-0.2;}
    else onGround = false;
    rpos = add(rpos, new v2(vel.x*2,0));
    if(vel.x<0&&map[(int)(rpos.x)][(int)(rpos.y)]!=0||map[(int)(rpos.x)][(int)(rpos.y+0.8)]!=0){rpos.x=floor(rpos.x+1)+0.001; vel.x=0;}
    else if(vel.x>0&&map[(int)(rpos.x+0.8)][(int)(rpos.y)]!=0||map[(int)(rpos.x+0.8)][(int)(rpos.y+0.8)]!=0){rpos.x=floor(rpos.x)+0.199; vel.x=0;}
    vel = mult(vel,0.98);
  }
  void safe(){
    pos=add(ppos,mult(sub(rpos,ppos),(float)(tick%multiSafe)/multiSafe));
  }
}

