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

class DynamicCollider extends Collider {

  float xVelocity;

  float predictFuture() {
    return xPos + xVelocity;
  }

  float distanceToObject(BasicObject target) {

    return target.xPos - right();
  }

  float distanceToTravel(BasicObject target) {

    float distance = distanceToObject(target);
    float future = predictFuture();

    if (distance < future) {
      return distance;
    }
    else {
      return future;
    }
  }
}





class StaticCollider {
}
