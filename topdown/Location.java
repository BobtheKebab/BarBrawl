public class Location {
    public int x, y;

    public Location(int _x, int _y) {
	      x = _x;
	      y = _y;
    }

    public boolean equals(Location l) {
	      return l.x == x && l.y == y;
    }
}