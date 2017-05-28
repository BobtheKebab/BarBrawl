class World {
  ArrayList<Wall> walls;
  ArrayList<Entity> entities;
  World() {
    walls = new ArrayList<Wall>();
    entities = new ArrayList<Entity>();
  }
  
  /**
  0:air, 1:wall
  */
  int whatsThere(Location l) {
    for(Wall w : walls) {
      if(intersects(w.xPos, w.yPos, w.wide, w.high, l)) {
        return 1;
      }
    }
    return 0;
  }
  
  boolean intersects(float x, float y, float w, float h, Location l) {
    return (l.x >= x && l.x <= x+w && l.y >= y && l.y <= y+h);
  }
  
  void hitAllAround(Entity target) {
    ArrayList<Entity> hit = new ArrayList<Entity>();
    for(Entity e : entities) {
      if(dist(e.xPos, e.yPos, target.xPos, target.yPos) < atk_radius) {
        e.getHit(atk_power);
      }
    }
    for(int i = 0; i < entities.size();) {
      if(!entities.get(i).isAlive()) {
        entities.remove(i);
        score += add_score;
        add_score *= 1.025;
        spawn_freq *= 0.985;
      }
      else i++;
    }
  }
  
  void add(Wall w) {
    walls.add(w);
  }
  void add(Entity e) {
    entities.add(e);
  }
  
  void update() {
    for(Entity e : entities) {
      e.update();
    }
  }
  
  void render() {
    for(Wall w: walls) {
      w.drawObject();
    }
    for(Entity e : entities) {
      e.drawObject();
    }
  }
}


class Wall extends BasicObject {
  float wide, high;
  
  Wall(float x, float y, float w, float h) {
    super(x, y);
    wide = w;
    high = h;
  }
  
  void drawObject() {
    fill(128, 128, 0);
    rect(xPos, yPos, wide, high);
  }
}