BasicObject myObject;
Player p;
float left, right, up, down;
World world;


void setup() {
  
  size(500, 500);
  
  background(color(0,0,0));
  myObject = new BasicObject(20.0,20.0);
  p = new Player(10, 10);
  world = new World();
  world.add(new Wall(20, 50, 100, 100));
  
}

void draw() {
  clear();
  healthBar();
  world.render();
  p.drawObject();
  move();
  
  //myObject.drawObject();
  
}

void healthBar() {
 fill(255, 255, 0); // Yellow external bar
 rect(0, 430, 500, 70);
 fill(255, 0, 0); // Red internal bar
 rect(10, 440, p.health * 48, 50);
}

void keyPressed() {
  if (key == 'k') {
    p.health -= 1; 
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