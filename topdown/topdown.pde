BasicObject myObject;


void setup() {
  
  size(512,512);
  
 background(color(0,0,0));
 myObject = new BasicObject(20.0,20.0);
  
}

void draw() {
  clear();
  
  myObject.drawObject();
  
}

void keyPressed() {
  
  if (key == 'd') {
    myObject.xPos += 5;
  }
  
}