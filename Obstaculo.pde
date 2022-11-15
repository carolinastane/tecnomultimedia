class Obstaculo {
  //atributos
  
  PImage tronco;

  int posXObstaculo, posYObstaculo, anchoObstaculo, altoObstaculo;
  float velocidad;



  //constructores
  Obstaculo(int posXObstaculo, int posYObstaculo) {

    this.tronco = loadImage("tronm2.png");

    this.anchoObstaculo = 60;
    this.altoObstaculo = 60;
    this.posXObstaculo = posXObstaculo;//440;
    this.posYObstaculo = posYObstaculo;  // 320;
    this.velocidad = 7;
  }


  //acciones
  void dibujar() {
    image(this.tronco, this.posXObstaculo, this.posYObstaculo, this.anchoObstaculo, this.altoObstaculo);
    moverOstaculo();
  }

  void moverOstaculo() {
    this.posXObstaculo-= this.velocidad;
  }
  //evaluo si hay o no colision, en caso de que haya, perder va a ser true
  boolean chocarConBlancanieves(float posXPj, float posYPj, float anchoPj, float altoPj) {
    if (
      posXPj-anchoPj/2 < this.posXObstaculo + this.anchoObstaculo/2
      && posXPj+anchoPj/2 > this.posXObstaculo-this.anchoObstaculo/2
      && posYPj-altoPj/2 < this.posYObstaculo + this.altoObstaculo/2
      && posYPj+altoPj/2 > this.posYObstaculo- this.altoObstaculo/2
      ){

      return true;
    } else {
      return false;
    }
  }
}
