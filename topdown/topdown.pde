BasicObject myObject;
BasicObject wall;
Player p;
Enemy e;
World world;
float left, right, up, down; // Movement
float atkDelay, atkThreshold = 150, atk_radius = 25, atk_power = 7; // Attack
float spawn_freq = 180; // Spawn
float score = 0, add_score = 1; // Score
float temp = 430; // Kill shortcut


void setup() {
  
  size(500, 500);
  
  background(105, 105, 105);
  myObject = new BasicObject(20.0,20.0);
  p = new Player(100, 100);
  world = new World();
  world.add(new Wall(20, 50, 100, 100));
  world.add(new Follower(300, 300));
  world.add(new Enemy(200, 200));
  
}

void draw() {
  background(105, 105, 105);
  gui();
  move();
  world.update();
  world.render();
  p.drawObject();
  spawn();
  atkDelay++;
}

void gui() {
  
 // Score
 fill(255, 255, 255);
 textAlign(CENTER);
 textSize(20);
 text("" + Math.floor(score), 250, 30);
 
 // Enclosing bar
 fill(255, 255, 0);
 rect(0, 430, 500, 70);
 
 // Health bar
 fill(255, 0, 0);
 rect(60, 440, p.health * 43, 50);
 
 // Attack cooldown
 if (atkDelay > atkThreshold) {
   fill(255, 255, 255);
 } else {
   fill(0, 0, 0);
 }
 ellipse(30, 465, 40, 40);
}

void spawn() {
  if(frameCount % Math.floor(spawn_freq) == 0) {
    float randX = random(500);
    float randY = random(400) + 30;
    while (dist(randX, randY, p.xPos, p.yPos) < 50) {
      randX = random(500);
      randY = random(400) + 30;
    }
    world.add(new Enemy(randX, randY));
  }
}

void keyPressed() {
  if (key == 'k' && temp > 0) {
    p.health -= 1; 
    temp -= 43;
    System.out.println(temp);
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