blockData bddb[];
void createBddb(){
  bddb = new blockData[]{
    new blockData(100,0,1,0.5,255,0,loadImage("data/texture/dirt.png")),
    new blockData(100,0,1,0.5,255,0,loadImage("data/texture/grass.png")),
    new blockData(100,0,1,0.5,255,0,loadImage("data/texture/stone.png")),
    new blockData(100,0,1,0.5,255,0,loadImage("data/texture/creeper.png"))
  };
}


class blockData{
  int health;
  int tool;
  float digk;
  float attk;
  int opacity;
  int light;
  PImage texture;
  blockData(int health,int tool,float digk,float attk,int opacity,int light,PImage texture){
    this.health=health;
    this.tool=tool;
    this.digk=digk;
    this.attk=attk;
    this.opacity=opacity;
    this.light=light;
    this.texture=texture;
  }
}
