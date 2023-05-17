class Ship {
  int x, y, health;
  PImage S1;

  Ship() {
    x = width/2;
    y = height-100;
    S1 = loadImage("ship.png");
  }
  void display() {
    imageMode(CENTER);
    S1.resize(150, 150);
    image(S1, x, y);
  }

  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }
  boolean intersect(Asteroid rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<rock.diam/2) {
      return true;
    } else {
      return false;
    }
  }

}
