// Samuel Brooks | 17 April | Etch-A-Sketch

int x, y;
PImage pic;

void setup() {
  size(displayWidth, displayHeight);
  size(500, 500);
  x = width/2;
  y= height/2;
  size(800,658);
  pic = loadImage("Etch.png");
}


void draw() {
  image(pic,0,0);
  strokeWeight(int(random(2,5)));
  fill(int(random(50,200)));

  //background(255);
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      moveUp(1);
    } else if (key == 's' || key == 'S') {
      moveDown(1);
    } else if (key == 'a' || key == 'A') {
      moveLeft(1);
    } else if (key == 'd' || key == 'D') {
      moveRight(1);
    }
  }
}


void mousePressed() { 
saveFrame("line-######.png");
}


void moveRight(int rep) {
  for (int i=0; i<rep; i=i+1) {
    point(x+i, y);
  }
  x = x + rep;
}

void moveLeft(int rep) {
  for (int i=0; i<rep; i=i+1) {
    point(x-i, y);
  }
  x = x - rep;
}
void moveUp(int rep) {
  for (int i=0; i<rep; i=i+1) {
    point(x, y-i);
  }
  y = y - rep;
}
void moveDown(int rep) {
  for (int i=0; i<rep; i=i+1) {
    point(x, y+i);
  }
  y = y + rep;
}
