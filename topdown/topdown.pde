BasicObject myObject;
Player p;


void setup() {
  
  size(512,512);
  
 background(color(0,0,0));
 myObject = new BasicObject(20.0,20.0);
 p = new Player(10, 10);
  
}

void draw() {
  clear();
  p.drawObject();
  //myObject.drawObject();
  
}

void keyPressed() {
  
  if (key == 'd') {
    p.xPos += 5;
  }
  
}