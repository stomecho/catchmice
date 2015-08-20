import processing.net.*; 
Client myClient;
int dataIn; 
int port=5204;
String s="";
void setup() {
  
  size(1000,1000);
  myClient = new Client(this,"10.10.10.119",port);
  textFont(createFont("細明體",50));
}

void draw() {
  
  background(0);
  if (myClient.available() > 0) {
    dataIn = myClient.read();
  }
 
  text(dataIn,100,100);
  text(s,100,200);
}



