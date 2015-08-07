void render(){
  fill(255);
  stroke(0);
  
  v2 rsp = range(new v2(0,0),new v2(mw,mh),c.startPos());
  v2 rep = range(new v2(0,0),new v2(mw,mh),c.endPos());
  rep = add(rep,new v2(1,1));
  println(rsp.x,rsp.y,rep.x,rep.y);
  for(int i=(int)rsp.x;i<(int)rep.x;i++)
  for(int j=(int)rsp.y;j<(int)rep.y;j++){
    
    rect(c.cp(new v2(i,j)),mult(new v2(1,1),c.cs(1)));
  }
}
