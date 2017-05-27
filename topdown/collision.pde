class Collider {

  float xPos;
  float yPos;

  float colliderWidth;
  float colliderHeight;
  
  Collider(float w, float h) { 
    colliderWidth = w;
    colliderHeight = h;
  }

  float bottom() {
    return colliderHeight + yPos;
  }
  float right() {
    return colliderWidth + xPos;
  }
}

class DynamicCollider extends Collider {

  float xVelocity;
  float yVelocity;
  
  DynamicCollider(float w, float h) {
    super(w,h);
  }
  
  float toTravelX(BasicObject target) {
    float top = target.yPos;
    float bottom = target.yPos + 100;
    float left = target.xPos;
    float right = target.xPos + 100;
    
    if (right() <= left & ((yPos >= top & yPos <= bottom) || (bottom() <= bottom & bottom() >= top))) {
       return min(xVelocity, left - right());
    }
    if (xPos >= right & ((yPos >= top & yPos <= bottom) || (bottom() <= bottom & bottom() >= top))) {
      return max(xVelocity, right - xPos);
    }
    
    else return xVelocity;
  }
  
  float toTravelY(BasicObject target) {
    float top = target.yPos;
    float bottom = target.yPos + 100;
    float left = target.xPos;
    float right = target.xPos + 100;
    
    if (bottom() <= top & ((xPos <= right & xPos >= left) || (right() <= right & right() >= left))) {
       return min(yVelocity, top - bottom());
    }
    if (yPos >= bottom & ((xPos <= right & xPos >= left) || (right() <= right & right() >= left))) {
      return max(yVelocity, bottom - yPos);
    }
    
    else return yVelocity;
  }
}

  





class StaticCollider {
}
