public class Location {
    public int x, y;

    public Location(int _x, int _y) {
	      x = _x;
	      y = _y;
    }
    
    public Location(float _x, float _y) {
        this((int)_x, (int)_y);
    }

    public boolean equals(Location l) {
	      return l.x == x && l.y == y;
    }
    
    public int distanceTo(Location l) {
        return (int)(Math.abs(l.x - x) + Math.abs(l.y - y));
    }
    
    /**
    0: north, 1:NE, 2: east, 3:SE, 4: south, 5:SW, 6: west, 7:NW
    */
    public Location getNeighbor(int dir) {
      dir = (int)(Math.abs(dir % 8));
      int newy = y, newx = x;
      if(dir == 0 || dir == 1 || dir == 7) newy--;
      if(dir == 3 || dir == 4 || dir == 5) newy++;
      if(dir == 1 || dir == 2 || dir == 3) newx++;
      if(dir == 5 || dir == 6 || dir == 7) newx--;
      return new Location(newx, newy);
    }
}