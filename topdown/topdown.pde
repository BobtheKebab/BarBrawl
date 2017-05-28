BasicObject myObject;
BasicObject wall;
Player p;
Enemy e;
World world;
float left, right, up, down, speed = 1; // Movement
float atkDelay, atkThreshold = 150, atk_radius = 25, atk_power = 7; // Attack
float spawn_freq = 180; // Spawn
int score = 0, highScore = 0;
float add_score = 1; // Score
float temp = 430; // Kill shortcut
float shopThreshold = 25; // Shop
String state;

void setup() {
  
  size(500, 500);
  
  background(105, 105, 105);
  myObject = new BasicObject(20.0,20.0);
  p = new Player(100, 100);
  world = new World();
  world.add(new Wall(50, 50, 20, height-150));
  world.add(new Wall(width-50, 50, 20, height-150));
  //world.add(new Follower(300, 300));
  world.add(new Enemy(200, 200));
  state = "play";
}

void draw() {
  if(state.equals("play")) {
    background(105, 105, 105);
    gui();
    move();
    world.update();
    p.update();
    world.render();
    p.drawObject();
    spawn();
    atkDelay++;
  }
  else if(state.equals("end")) {
    background(map(sin(millis()*PI/720), -1, 1, 85, 125), 105, 105);
    fill(255);
    textAlign(CENTER);
    textSize(36);
    text("GAME OVER", width/2, height/3);
    textSize(20);
    text("PRESS R TO RESTART", width/2, height/2);
    if(keyPressed && (key == 'r' || key == 'R')) restart();
  }
  else if(state.equals("shop")) {
    background(150);
    fill(255);
    textAlign(CENTER);
    textSize(36);
    text("SHOP", width/2, height/8);
    textSize(18);
    textAlign(LEFT);
    fill(60, 150, 60);
    rect(50, height/3, width-100, 50);
    fill(0);
    text("1) Faster", 80, height/3+25);
  }
}

void gui() {
  
 // Score
 fill(255, 255, 255);
 textAlign(CENTER);
 textSize(30);
 text("" + score, width/2, 30);
 
 // Highscore
 textSize(10);
 text("Highest", 40, 15);
 textSize(15);
 text("" + highScore, 40, 30);
 
 // Enclosing bar
 fill(20, 100, 120);
 rect(0, 430, 500, 70);
 
 // Health bar
 fill(40, 190, 230);
 rect(60, 440, p.health * 43, 50, 20);
 
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
  if (key == 'k') {
    if (state == "shop") {
      state = "play";
    } else { 
      state = "shop";
    }
  }
  if (key == '1' && state == "shop") {
    speed += .1;
    state = "play";
  }
  if (key == '2' && state == "shop") {
    atk_radius += 5;
    state = "play";
  }
  if (key == '3' && state == "shop") {
    atkThreshold -= 15;
    state = "play";
  }
  if (key == '4' && state == "shop") {
    atk_power += 2;
    state = "play";
  }
  if (key == 'b' && atkDelay > atkThreshold) {
   atkDelay = 0;
   p.attack(); 
  }
  if (key == 'w') {
    up = speed;
  }
  if (key == 'a') {
    left = speed; 
  }
  if (key == 's') {
    down = speed;
  }
  if (key == 'd') {
    right = speed;
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

void restart() {
  p = new Player(width/2, height/2);
  world = new World();
  world.add(new Wall(100, 100, width-200, 30));
  world.add(new Wall(100, height-200, width-200, 30));
  state = "play";
  spawn_freq = 180;
  highScore = score;
  score = 0;
}