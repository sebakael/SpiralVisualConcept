class Sun {

  PVector location = new PVector();
  PVector speed = new PVector();
  int size;
  int sec = 10;

  Sun() {
    location.x = width/2;
    location.y = height/2;
    size = width/4;
    speed.y = height / (60 * sec);
  }

  void display() {
    strokeWeight(0);
    fill(255, 0, 0);
    //fill(255,0,0);
    //for (int i = 0; i < size; i = i+1) {
    //  ellipse(location.x, location.y, i, i);
    //}
    ellipse(location.x, location.y, size, size);
  }

  void moveY() {
    if ((location.y <= 0) || (location.y >=height)) {
      speed.y *= -1;
    }
    location.y -= speed.y;
    location.y = constrain(location.y, 0, height);
  }
}
