DynamicObject myObject;
BasicObject wall;
Player p;


void setup() {
  
  size(1000,512);
  
 background(color(0,0,0));
 myObject = new DynamicObject(200,400);
 myObject.yVelocity = -2.6;
 myObject.xVelocity = -.5;
 wall = new BasicObject(220,20);
 // p = new Player(10, 10);
}

void draw() {
  clear();
//  p.drawObject();
//  
//  if (keyPressed) {
//    if (key == 'w') {
//       p.yPos -= 1;
//    }
//    if (key == 'a') {
//       p.xPos -= 1; 
//    }
//    if (key == 's') {
//       p.yPos += 1;
//    }
//    if (key == 'd') {
//       p.xPos += 1;
//    }
   
//  }
  myObject.drawObject();
  wall.drawObject();
  myObject.move();
  
}

void keyPressed() {
  
  if (key == 'd') {
    p.xPos += 5;
  }
  
}
