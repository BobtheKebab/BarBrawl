abstract class Entity extends DynamicObject {
  float health, power;
  
  Entity(float x, float y) {super(x, y);}
  
  boolean isAlive() {return health > 0.0;}
  
  abstract void update();
  
  abstract void getHit(float damage);
  
  abstract void drawObject();
}


class Player extends Entity {
  public Player(float x, float y) {
    super(x, y);
    yVelocity = 0;
    xVelocity = 0;
    health = 10.0;
    power = 1.0;
  }
  
  void getHit(float damage) {}
  
  void update() {}
  
  void drawObject() {
    fill(0, 0, 255);
    ellipse(xPos, yPos, 10, 10);
  }
}


class Enemy extends Entity {
  Enemy(float x, float y) {
    super(x, y);
  }
  
  void getHit(float damage) {
    health -= damage;
  }
  
  void drawObject() {
    fill(255, 0, 0);
    rect(xPos, yPos, 10, 10);
  }
  
  void update() {
    PriorityQueue pq = new PriorityQueue();
    int toPlayer = (int)(Math.abs(xPos - p.xPos) + Math.abs(yPos - p.yPos));
    pq.add(new Node(new Location(xPos, yPos), null, 0, toPlayer, true));
  }
}