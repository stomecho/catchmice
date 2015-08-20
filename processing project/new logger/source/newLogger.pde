DisposeHandler dh;
logger[] loggers = new logger[4];
int[] layer = new int[4];
int t=0;
void setup(){
  dh = new DisposeHandler(this);
  size(1600,900);
  loggers[0] = new logger("SIN WAVE",50,50,160,90);
  loggers[1] = new logger("COS WAVE",50,200,160,90);
  loggers[2] = new logger("MOUSE X",250,50,160,90);
  loggers[3] = new logger("MOUSE Y",250,200,160,90);
  for(int i=0;i<layer.length;i++)layer[i] = i;
}

void draw(){
  t++;
  background(255);
  loggers[0].add(sin(t*0.01)*1000);
  loggers[1].add(cos(t*0.01)*1000);
  loggers[2].add(mouseX-width*0.5);
  loggers[3].add(mouseY-height*0.5);
  for(int i=layer.length-1;i>=0;i--) loggers[layer[i]].draw();
}

void mousePressed(){
  int i;
  for(i=0;i<loggers.length;i++) {if(loggers[layer[i]].pressCheck())break;}
  if(i<loggers.length){
    int temp = layer[0];
    layer[0] = layer[i];
    layer[i] = temp;
  }
}

public class DisposeHandler {
   
  DisposeHandler(PApplet pa)
  {
    pa.registerMethod("dispose", this);
  }
   
  public void dispose()
  {      
    println("Closing sketch");
    for(logger l : loggers)l.savedata();
  }
}
