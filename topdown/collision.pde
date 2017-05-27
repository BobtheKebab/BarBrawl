class Collider {
  
  float xPos;
  float yPos;
  
  float colliderWidth;
  float colliderHeight;
  
  float bottom() {
    
    return colliderHeight + yPos;
    
  }
  float right() {
   return colliderWidth + xPos; 
  }
  
}