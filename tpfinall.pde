//https://youtu.be/_vxDMzVf1ik
import ddf.minim.*;

Minim minim;
AudioPlayer player, player2;

Juego juego;

void setup() {
  size(500, 400);
  juego= new Juego();
   minim = new Minim(this);
  player = minim.loadFile("AUD-20221113-WA0063_");
}


void draw() {
  juego.dibujar();
}

void mouseClicked() {
  juego.mouseClikeado();
}
