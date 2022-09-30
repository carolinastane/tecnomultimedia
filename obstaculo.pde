class Obstaculo {
  //atributos
  
  PImage blob;

  int posXObstaculo, posYObstaculo, anchoObstaculo, altoObstaculo;
  float velocidad;



  //constructores
  Obstaculo(int posXObstaculo, int posYObstaculo) {

    this.blob = loadImage("bloob.png");

    this.anchoObstaculo = 60;
    this.altoObstaculo = 40;
    this.posXObstaculo = posXObstaculo;
    this.posYObstaculo = posYObstaculo;  
    this.velocidad = 5;
  }


  //acciones
  void dibujar() {
    image(this.blob, this.posXObstaculo, this.posYObstaculo, this.anchoObstaculo, this.altoObstaculo);
    moverOstaculo();
  }

  void moverOstaculo() {
    this.posXObstaculo-= this.velocidad;
  }
  //evaluo si hay o no colision, en caso de que haya, perder va a ser true
  boolean chocarConSubmarino(float posXSub, float posYSub, float anchoSub, float altoSub) {
    if (
      posXSub-anchoSub/2 < this.posXObstaculo + this.anchoObstaculo/2
      && posXSub+anchoSub/2 > this.posXObstaculo-this.anchoObstaculo/2
      && posYSub-altoSub/2 < this.posYObstaculo + this.altoObstaculo/2
      && posYSub+altoSub/2 > this.posYObstaculo- this.altoObstaculo/2
      ){

      return true;
    } else {
      return false;
    }
  }
}
