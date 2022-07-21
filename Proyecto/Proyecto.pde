float BolaX = 0;
int BolaY = 0;
int IncX = 0;
int IncY = 0;
int AnchoPantalla = 0;
int AltoPantalla = 0;

float barraX1 = 0;
float barraX2 = 0;
float barraY = 0;

float movimiento =0;

boolean bolaEnJuego = true;

int cantidadRebotes = 0;

void setup() {
  size(500, 500);
  frameRate(20);
  valoresPorDefecto();
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
  
  String textoRebotes = "Cantidad de rebotes: ";
  
  fill(0);
  textSize(18);
  text(textoRebotes + " " + Integer.toString(cantidadRebotes), 10, 30);
  
  
  
  fill(204, 102, 0);
  
  BolaX=BolaX+IncX;
  BolaY=BolaY+IncY;
  
  if (bolaEnJuego) {
    if ((BolaY >= barraY && BolaY <= barraY + 25 && estaEnRango(BolaX))) {
      IncY=IncY*(-1);
      cantidadRebotes += 1;
    }
    
    if(BolaY<=0){
      IncY=IncY*(-1);
    }
    
    if (BolaX<=0 || BolaX>=AnchoPantalla) {
      IncX=IncX*(-1);
    }
    
    if (BolaY >= AltoPantalla) {
      bolaEnJuego = false;
      noLoop();
      mostrarTextoFinDelJuego();
    }
  }
}

// Define si la bola esta en contacto con la barra
boolean estaEnRango(float bolaX) {
   return barraX1 <= bolaX && barraX2 >= bolaX;
}

// Restablecer valores por defecto al iniciar o al reiniciar el juego
void valoresPorDefecto(){
  BolaX = random(500);
  BolaY = 10;
  IncX = 20;
  IncY = 20;
  barraX1 = 160;
  barraX2 = 340;
  barraY = 450;
  AnchoPantalla = 500;
  AltoPantalla = 500;
  movimiento = 10;
  bolaEnJuego = true;
  cantidadRebotes = 0;
}

void mostrarTextoFinDelJuego(){
  String finDelJuego = "Fin del juego.";
  String reiniciarJuego = "Presione ENTER para iniciar de nuevo";
  
  textSize(50);
  text(finDelJuego, 100, 200);  // Text wraps within text box
  textSize(15);
  text(reiniciarJuego, 120, 230);  // Text wraps within text box
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
  else if(key == ENTER && !bolaEnJuego){
    print("enter");
    valoresPorDefecto();
    loop();
  }
}
