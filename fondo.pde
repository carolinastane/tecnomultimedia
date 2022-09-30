class Fondomar {

  //atributos

  PImage fondomar;

  float posXFondom, posYFondom, anchoFondom, altoFondom, velXFondom;
  boolean juego;



  //constructores
  Fondomar() {
    this.fondomar = loadImage("fondomar.jpg");
    this.posXFondom=0;
    this.velXFondom=-2;
  }

  //acciones
  void dibujar() {
    image(this.fondomar, this.posXFondom, 0, width*2, height);

    this.posXFondom+=this.velXFondom;

    if (this.posXFondom<-width) {
      this.posXFondom=0;
    }
  }
}
