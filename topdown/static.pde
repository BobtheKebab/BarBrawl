class basicObject {
  
  float xPos;
  float yPos;
  
  
  basicObject(float inX, float inY) {
   this.xPos = inX;
   this.yPos = inY;
  }
  
  void drawObject() {
    rect(xPos, yPos, 100, 100);
    
  }
  
}

class dynamicObject extends basicObject {
  
  float xVelocity;
  float yVelocity;
  
}
