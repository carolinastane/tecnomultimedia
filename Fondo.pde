class Fondo {

  //atributos

  PImage fondo;

  float posXFondo, posYFondo, anchoFondo, altoFondo, velXFondo;
  boolean juego;



  //constructores
  Fondo() {
    this.fondo = loadImage("bosquesito2.jpg");
    this.posXFondo=0;
    this.velXFondo=-2;
  }

  //acciones
  void dibujar() {
    image(this.fondo, this.posXFondo, 0, width*2, height);

    this.posXFondo+=this.velXFondo;

    if (this.posXFondo<-width) {
      this.posXFondo=0;
    }
  }
}
