BasicObject myObject;
BasicObject wall;
Player p;
Enemy e;
float left, right, up, down, atkDelay, atkThreshold = 150;
World world;


void setup() {
  
  size(500, 500);
  
  background(139, 69, 19);
  myObject = new BasicObject(20.0,20.0);
  p = new Player(100, 100);
  e = new Follower(300, 300);
  world = new World();
  world.add(new Wall(20, 50, 100, 100));
}

void draw() {
  clear();
  gui();
  e.update();
  world.render();
  p.drawObject();
  e.drawObject();
  move();
  atkDelay++;
}

void gui() {
 fill(255, 255, 0); // Yellow external bar
 rect(0, 430, 500, 70);
 fill(255, 0, 0); // Red internal bar
 rect(10, 440, p.health * 48, 50);
 if (atkDelay > atkThreshold) {
   fill(0, 0, 255);
 } else {
   fill(0, 0, 0);
 }
 ellipse(50, 430, 30, 30);
}

void keyPressed() {
  if (key == 'k') {
    p.health -= 1; 
  }
  if (key == 'b' && atkDelay > atkThreshold) {
   atkDelay = 0;
   p.attack(); 
  }
  if (key == 'w') {
    up = 1;
  }
  if (key == 'a') {
    left = 1; 
  }
  if (key == 's') {
    down = 1;
  }
  if (key == 'd') {
    right = 1;
  }
  
}

void keyReleased() {
  if (key == 'w') {
    up = 0;
  }
  if (key == 'a') {
    left = 0; 
  }
  if (key == 's') {
    down = 0;
  }
  if (key == 'd') {
    right = 0;
  }
}

void move() {
 p.yPos = max(p.yPos - up, 0);
 p.yPos = min(p.yPos + down, 420);
 p.xPos = max(p.xPos - left, 0);
 p.xPos = min(p.xPos + right, 490);
}