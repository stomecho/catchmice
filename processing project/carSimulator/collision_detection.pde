void colDet() {
  colCal(c.pos, c.vel, 150, 50, cclomen.pos, cclomen.vel, 100, 20);
}

void colCal(v2 pos1, v2v vel1, float r1, float m1, v2 pos2, v2v vel2, float r2, float m2) {
  v2v d = add( sub(pos1, pos2).toV2v(), sub(vel1, vel2));
  if (d.len<=r1*0.5+r2*0.5) {
    v2v f = sub(vel2.projection(d.angle), vel1.projection(d.angle) );
    if(hit==false) hamp=f.len/10;
    hit=true;
    f=add(f, mult(new v2v(d.angle, r1*0.5+r2*0.5-sub(pos1, pos2).len()), 0.2));
    vel1.set(add(vel1, mult(f, (m1+m2)/m1*0.5)));
    vel2.set(sub(vel2, mult(f, (m1+m2)/m2*0.5)));
  }
}
