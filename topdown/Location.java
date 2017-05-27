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
      return null;
    }
}