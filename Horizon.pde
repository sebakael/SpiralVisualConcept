class Horizon {
  float curY;
  float constraint;
  float maxY;
  float minY;

  Horizon() {
    curY = (height/3) * 2;
    constraint = height/24;
    maxY = curY + constraint;
    minY = curY - constraint;
  }

  void display() {
    strokeWeight(0);
    fill(0, 0, 255);
    //for (int i = 0; i < curY; i = i+1) {
    //  rect(0, curY + i, width, height);
    //}
    rect(0,curY,width,height);
  }
  
  void update(){
    curY = curY + random(-.1,.1);
    curY = constrain(curY, minY, maxY);
  }
}
