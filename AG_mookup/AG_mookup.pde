//IP Adresse v4 ODER V6
//hostname zb HSI-KBW-046-005-255-209.hsi8.kabel-badenwuerttemberg.de
//Browser zb Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Safari/605.1.15

int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;
int ip1;
int ip2;
int ip3;
int ip4;
int Deck1x;
int Deck2x;
int Deck3x;
int Deck4x;
int Deck1y;
int Deck2y;
int Deck3y;
int Deck4y;

void setup() {  
  size(1280, 720);
  frameRate(30);
  b1 = color(255);
  b2 = color(0);
  c1 = color(204, 102, 0);
  c2 = color(0, 102, 153);
  
  doSomething();
}

void doSomething() {
  ip1 = int(random(127));
  ip2 = int(random(127));
  ip3 = int(random(127));
  ip4 = int(random(127));
  c1 = color(ip1, ip2, ip3);
  c2 = color(ip3, ip1, ip4);
  println("IP: " + ip1 +"."+ip2+"."+ip3+"."+ip4);
  Deck1x = int(random(120,800));
    Deck2x = int(random(120,800));
  Deck3x= int(random(120,800));
  Deck4x = int(random(120,800));
    Deck3y = int(random(120,400));
    Deck4y = int(random(120,400));
  Deck1y= int(random(120,400));
  Deck2y = int(random(120,400));

}

void draw() {  // draw() loops forever, until stopped
  background(0); //black out
   setGradient(0, 0, width/2, height, b1, b2, X_AXIS);
  setGradient(width/2, 0, width/2, height, b2, b1, X_AXIS);
  // Foreground
  setGradient(100, 100, 1080, 520, c2, c1, X_AXIS);
  setGradient(Deck1x, Deck1y, ip4, 2*ip2, 125, 0, Y_AXIS);
  setGradient(Deck2x, Deck2y, ip2, 2*ip1, 125, 0, Y_AXIS);
  setGradient(Deck3x, Deck3y, ip1, 2*ip3, 125, 0, Y_AXIS);
  setGradient(Deck4x, Deck4y, ip3, 2*ip4, 125, 0, Y_AXIS);
  textSize(28);

  text("IP: " + ip1 +"."+ip2+"."+ip3+"."+ip4, 30, 30); 
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

void keyPressed() {
doSomething();
}
