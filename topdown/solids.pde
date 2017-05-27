class World {
  ArrayList<Wall> walls;
  World() {
    walls = new ArrayList<Wall>();
  }
  
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
  
  void add(Wall w) {
    walls.add(w);
  }
  
  void render() {
    for(Wall w: walls) {
      w.drawObject();
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