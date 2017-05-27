static class BasicObject {
  
  float xPos;
  float yPos;
  
  
  BasicObject(float inX, float inY) {
   this.xPos = inX;
   this.yPos = inY;
  }
  
  void onCollide() {}
  
  /*void drawObject() {
    rect(xPos, yPos, 100, 100);
    
  }*/
  
}

static class DynamicObject extends BasicObject {
  
  float xVelocity;
  float yVelocity;
  
  DynamicObject(float x, float y) {
    super(x, y);
  }
  
  void onCollide() {
    PVector velocity = new PVector(xVelocity, yVelocity);
    velocity.rotate(HALF_PI);
    xVelocity = velocity.x;
    yVelocity = velocity.y;
  }
  
}