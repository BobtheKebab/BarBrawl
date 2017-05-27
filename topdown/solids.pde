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
  
  boolean intersects(int x, int y, int w, int h, Location l) {
    return (l.x >= x && l.x <= x+w && l.y >= y && l.y <= y+h);
  }
  
  void add(Wall w) {
    walls.add(w);
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