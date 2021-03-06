import java.util.NoSuchElementException;

public class MyHeap {
    Node[] contents;
    int size, dir;

    public MyHeap(boolean maxMin) {
	contents = new Node[16];
	size = 0;
	dir = maxMin? 1 : -1;
    }

    public MyHeap() {
	this(true);
    }

    public void add(Node n) {
	makeSpace();
	contents[1+size] = n;
	size++;
	bubbleUp();
    }

    public Node remove() {
	if(size < 1)
	    throw new NoSuchElementException("Cant remove from empty heap!");
	Node biggest = contents[1];
	//move a bottom row element to the root
	contents[1] = contents[size];
	size--;
	//now move it back down and find a replacement root
	bubbleDown();
	return biggest;
    }

    public Node peek() {
	if(size < 1)
	    throw new NoSuchElementException("Cant peek an empty heap!");
	return contents[1];
    }

    private void makeSpace() {
	if(contents.length <= size+1) { //because index#0 isnt used
	    Node[] bigger = new Node[contents.length*2];
	    for(int i = 1; i < contents.length; i++) {
		bigger[i] = contents[i];
	    }
	    contents = bigger;
	}
    }

    /**
       Puts the last added element in the right position
     */
    private void bubbleUp() {
	int index = size;
	int parent = index/2;
	while(index > 1) {
	    if(dir*contents[index].compareTo(contents[parent]) > 0) {
		Node temp = contents[index];
		contents[index] = contents[parent];
		contents[parent] = temp;
		index = parent;
		parent /= 2;
	    } else {
		break;
	    }
	}
    }

    /**
       Puts the root element in the right position
     */
    private void bubbleDown() {
	int index = 1, child0 = index*2, child1 = index*2 + 1;
	while(index < size) {
	    if(child0 > size) break; //no children
	    else if(child1 > size) { //one child
		if(!ordered(index, child0)) {
		    swap(index, child0);
		}
		break;
	    }
	    else { //two children
		int which; //the child with which the parent will swap
		if(ordered(index, child0) && ordered(index, child1)) {
		    break; //everything in its right place
		}
		else if(!ordered(index, child0) && ordered(index, child1)) {
		    which = child0;
		}
		else if(ordered(index, child0) && !ordered(index, child1)) {
		    which = child1;
		}
		else {
		    if(!ordered(child0, child1)) which = child1;
		    else which = child0;
		}
		swap(index, which);
		index = which;
		child0 = index * 2;
		child1 = child0 + 1;
	    }
	}
    }

    /**
       Swaps the strings at the two indices
     */
    private void swap(int index1, int index2) {
	Node temp = contents[index1];
	contents[index1] = contents[index2];
	contents[index2] = temp;
    }

    /**
       Returns true if the heap's property is maintained
       between the two elements(either min or max, depends
       on the value of dir).
     */
    private boolean ordered(int parent, int child) {
	return dir*contents[parent].compareTo(contents[child]) > 0;
    }

    /**
       Compares first element to the second and then the third.
       Returns 0 if everything is in order, 1 if the 2nd element
       is out of order and 2 is the 3rd element is out of order.
       @param parent   index of parent
       @param child1   index of first child to check
       @param child2   index of second child to check
     */
    private int check(int parent, int child1, int child2) {
	if(!ordered(parent, child1)) return 1;
	if(!ordered(parent, child2)) return 2;
	return 0;
    }

    public int size() {return size;}

    public String toStringDebug() {
	String str = "[";
	for(int i = 0; i < contents.length; i++) {
	    str += contents[i];
	    if(i < contents.length-1) str += "  ";
	}
	return str+"]";
    }

    public String toString() {
	String str = "[";
	for(int i = 1; i <= size; i++) {
	    str += contents[i];
	    if(i < size) str += "  ";
	}
	return str+"]";
    }

    public void tree() {
	tree(1, "");
    }
    private void tree(int index, String tabs) {
	if(index <= size) {
	    System.out.println(tabs + contents[index]);
	    tree(index*2, tabs+"  ");
	    tree(index*2 + 1, tabs+"  ");
	}
    }
}
