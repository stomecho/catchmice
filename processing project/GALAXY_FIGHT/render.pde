void render(){
//  fill(255);
//  stroke(0);
//  
//  v2 rsp = range(new v2(0,0),new v2(mw,mh),c.startPos());
//  v2 rep = range(new v2(0,0),new v2(mw,mh),c.endPos());
//  rep = add(rep,new v2(1,1));
//  println(rsp.x,rsp.y,rep.x,rep.y);
//  for(int i=(int)rsp.x;i<(int)rep.x;i++)
//  for(int j=(int)rsp.y;j<(int)rep.y;j++){
//    
//    rect(c.cp(new v2(i,j)),mult(new v2(1,1),c.cs(1)));
//  }
  background(0);
  if(twoCam){
    
    c1.draw();
    c2.draw();
    
    stw += (10-stw)*0.1;
    
  }
  else {
    stw += (0-stw)*0.1;
    c.draw();
  }
  
  if(stw>0.2){
    stroke(255);
    strokeWeight(stw);
    line(width*0.5,0,width*0.5,height);
  }
  
  //for(logger l : logs) l.draw();
}
