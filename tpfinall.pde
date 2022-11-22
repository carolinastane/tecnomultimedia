import ddf.minim.*;

Minim minim;
AudioPlayer player, player2;

Juego juego;

void setup() {
  size(500, 400);
  juego= new Juego();
   minim = new Minim(this);
  player = minim.loadFile("a.mp3");
}


void draw() {
  juego.dibujar();
}

void mouseClicked() {
  juego.mouseClikeado();
}
