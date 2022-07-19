float BolaX = random(500);
int BolaY = 10;
int IncX = 20;
int IncY = 20;
int AnchoPantalla = 500;
int AltoPantalla = 500;

float barraX1 = 160;
float barraX2 = 340;
float barraY = 450;

float movimiento = 10;

void setup() {
  size(500, 500);
  frameRate(10);
  println(int(random(10)));
  if (int(random(2)) % 2 == 0) {
    IncX=IncX*(-1);
  }
}

void draw() {
  background(255);
  stroke(0,0,0);
  strokeWeight(16);
  line(barraX1, barraY, barraX2, barraY);
  strokeWeight(1);
  ellipse(BolaX, BolaY, 20, 20);
  BolaX=BolaX+IncX;
  BolaY=BolaY+IncY;
  if (BolaY >= barraY && estaEnRango(BolaX)) {
    IncY=IncY*(-1);
    return;
  }
  if (BolaX<=0 || BolaX>=AnchoPantalla) {
    IncX=IncX*(-1);
  }
  if (BolaY<=0 || BolaY>=AltoPantalla) {
    IncY=IncY*(-1);
  }
}

boolean estaEnRango(float bolaX) {
   return barraX1 <= bolaX && barraX2 >= bolaX;
}

void keyPressed() {
   if (key == CODED) {
    if (keyCode == LEFT && barraX1 != -10) {
      barraX1 = barraX1 - movimiento;
      barraX2 = barraX2 - movimiento;
    } else if (keyCode == RIGHT && barraX2 != 510) {
      barraX1 = barraX1 + movimiento;
      barraX2 = barraX2 + movimiento;
    }
  }
}
