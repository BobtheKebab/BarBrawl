import java.lang.Comparable;

public class Node implements Comparable<Node> {
    public  Location loc;
    private Node previous;
    private int distToStart;
    private int distToGoal;
    private boolean astar;

    public Node(Location l, Node prev, int s, int g, boolean _astar) {
	      loc = l;
	      previous = prev;
	      distToStart = s;
	      distToGoal  = g;
	      astar = _astar;
    }

    public int compareTo(Node other) {
	      if(astar)
	          return (distToStart+distToGoal) - (other.distToStart+other.distToGoal);
	      return distToGoal - other.distToGoal;
    }

    public int distTraveled() {
	      return distToStart;
    }

    public String toString() {
	      return "("+loc.x+", "+loc.y+")";
    }

    public Node getPrevious() {return previous;}
    
    public int distanceTo(Node n) {
        return loc.distanceTo(n.loc);
    }
    
    public Node[] getNeighbors(Location goal) {
        Node[] ns = new Node[8];
        for(int i = 0; i < 8; i++) {
            Location l = loc.getNeighbor(i);
            ns[i] = new Node(loc.getNeighbor(i), this, distTraveled()+1, l.distanceTo(goal), astar);
        }
        return ns;
    }
}