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
  
  DynamicCollider myCollider = new DynamicCollider(100,100);
  
  
  float xVelocity;
  float yVelocity;
  
  DynamicObject(float x, float y) {
    super(x, y);
  }
  
  void move() {
    
    myCollider.xPos = this.xPos;
    myCollider.yPos = this.yPos;
    myCollider.xVelocity = xVelocity;
    myCollider.yVelocity = yVelocity;
    xVelocity = myCollider.toTravelX(wall);
    yVelocity = myCollider.toTravelY(wall);
    
   xPos += xVelocity;
   yPos += yVelocity;
    
  }
  
}