public class Location {
    public int x, y;

    public Location(int _x, int _y) {
	      x = _x;
	      y = _y;
    }

    public boolean equals(Location l) {
	      return l.x == x && l.y == y;
    }
    
    public int distanceTo(Location l) {
        return (int)(Math.abs(l.x - x) + Math.abs(l.y - y));
    }
}