void cowAI(car t){
  v2v d = add( sub(t.pos,cclomen.pos).toV2v() , sub(t.pos,cclomen.pos));
  if(d.len>200){
    if(d.projection(cclomen.cowAngle).len>=-500) cclomen.speed+=0.008;
    else cclomen.speed-=0.008;
    if(d.projection(cclomen.cowAngle+HALF_PI).len>0) cclomen.wheelAngle+=0.01;
    else cclomen.wheelAngle-=0.01;
  }
}

void carAI(cow t){
  v2v d = add( sub(t.pos,c.pos).toV2v() , sub(t.pos,c.pos));
  if(d.len>200){
    if(d.projection(c.carAngle).len>=-500) c.speed+=0.02;
    else c.speed-=0.02;
    if(d.projection(c.carAngle+HALF_PI).len>0) c.wheelAngle+=0.006;
    else c.wheelAngle-=0.006;
  }
}
