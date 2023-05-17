class Asteroid {
  int x, y, speed, diam;
  PImage A1;

  Asteroid() {
    x = int(random(width));
    y = -50;
    speed = int(random(2, 6));
    diam = int(random(30, 200));
    A1 = loadImage("asteroid.png");
  }



  void display() {
    imageMode(CENTER);
    A1.resize(diam, diam);
    image(A1, x, y);
  }

  void move() {
    y +=speed;
  }
  boolean reachedbottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }

  //void move() {
  //if(x<-50) {
  //x = width+50;
}
// x = x - 1;
// }
//}
