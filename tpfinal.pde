Juego juego;

void setup() {
  size(500, 400);
  juego= new Juego();
}


void draw() {
  juego.dibujar();
}

void mouseClicked() {
  juego.mouseClikeado();
}
