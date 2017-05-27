class BasicObject {
  
  float xPos;
  float yPos;
  
  
  BasicObject(float inX, float inY) {
   this.xPos = inX;
   this.yPos = inY;
  }
  
  void drawObject() {
    rect(xPos, yPos, 100, 100);
    
  }
  
}

class DynamicObject extends BasicObject {
  
  float xVelocity;
  float yVelocity;
  
  DynamicObject(float x, float y) {
    super(x, y);
  }
  
}