// Samuel Brooks | 26 April 2023 | Asteroids
boolean play;
Ship uel;
Asteroid bob;
Asteroid bob2;
Asteroid bob3;
//PImage bg;
int score;
int lives;
float AsteroidDist;
Timer AsteroidTimer, puTimer;
ArrayList<Asteroid> Asteroids = new ArrayList<Asteroid>();
int  level, AsteroidRate, AsteroidPassed, AsteroidCount, laserCount;



void setup() {
  size(500, 800);
  play = false;
  uel = new Ship();
  // bob = new Asteroid();
  //bg = loadImage ("bg.png");
  score = 0;
  //lives = 1;
  puTimer = new Timer(5000);
  puTimer.start();
  AsteroidRate = 2000;
  AsteroidTimer = new Timer(int(random(500, AsteroidRate)));
  AsteroidTimer.start();

  score = 0;
  level = 1;
  AsteroidCount = 0;
  laserCount = 0;
  AsteroidPassed = 0;
  play = false;
}



void draw() {
  println (AsteroidDist);
  if (!play) {
    startScreen();
  } else {
    //AsteroidDist = dist(bob.x, bob.y, uel.x, uel.y);
    background(128);
    drawBackground();
    infoPanel();
    uel.display();
    //bob.display();
    //bob.move();
    uel.move(mouseX, mouseY);

    if (AsteroidTimer.isFinished()) {
      Asteroids.add(new Asteroid());
      AsteroidTimer.start();
      println(Asteroids.size());
    }
    for (int i = 0; i < Asteroids.size(); i++) {
      Asteroid r = Asteroids.get(i);
      if (uel.intersect(r)) {
        uel.health-= r.diam;
        score = r.diam;
        Asteroids.remove(r);
      }
      if (r.reachedbottom()) {
        Asteroids.remove(r);
        AsteroidPassed++;
      } else {
        r.display();
        r.move();
      }
    }
    if (AsteroidPassed > 10) {
      gameOver();
    }
  }
}


//if (Asteroid < 100) {
//Asteroid.x = bob.x;
//lives = lives - 1;
//score =score - 100;
// bob.x = width;
// Asteroid.x = bob.x;
// uel.y = bob.y;
// gameOver();
//}
// }
//}
void keyPressed() {
  if (key == ' ') {
    play = true;
  }
}

void drawBackground() {
  background(0);
  fill(0);
  //image(bg,0,0);
}

void startScreen() {
  background(0);
  fill(255);
  textSize(40);
  textAlign(CENTER);
  text("Welcome to Asteroids!", width/2, 300);
  text("by Samuel Brooks", width/2, 350);
  text("Hit Space to start", width/2, 400);
}

void gameOver() {
  background(0);
  fill(255);
  textSize(40);
  textAlign(CENTER);
  text("Game Over :(", width/2, 300);
  text("Score:" + score, width/2, 450);
  text("Better luck next time", width/2, 400);
  noLoop();
}

void infoPanel() {
  fill(128, 128);
  rect(0, 0, width, 80);
  fill(0);
  textSize(40);
  text("Score:" + score, 68, 80);
}
