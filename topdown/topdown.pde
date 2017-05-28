BasicObject myObject;
BasicObject wall;
Player p;
Enemy e;
float left, right, up, down;
World world;


void setup() {
  
  size(500, 500);
  
  background(139, 69, 19);
  myObject = new BasicObject(20.0,20.0);
  p = new Player(250, 250);
  e = new Enemy(300, 300);
  world = new World();
  world.add(new Wall(20, 50, 100, 100));
}

void draw() {
  clear();
  healthBar();
  e.update();
  world.render();
  p.drawObject();
  e.drawObject();
  move();
  
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