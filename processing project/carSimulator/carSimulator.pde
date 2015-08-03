car c = new car(new v2(100, 100), 0);
boolean smode = false;

PImage background;
void setup() {
  size(500, 500);
  frame.setResizable(true);
  ctrlInit();
  c.initTexture();
  background = loadImage("map1.png");
  imageMode(CENTER);
}

void draw() {
  if(smode) image(background,width/2,height/2);
  else image(background,width/2,height/2);
  if (keyPress[UP])c.speed+=0.01;
  if (keyPress[DOWN])c.speed-=0.01;
  if (keyPress[LEFT])c.wheelAngle-=0.01;
  if (keyPress[RIGHT])c.wheelAngle+=0.01;
  c.run();
  c.draw();
}

