class Boton {
  //atributos

  int posX, posY, ancho, alto;
  String txt;


  //constructores
  Boton(String _txt, int _posY) {

    this.posX= width/2;
    this.posY= _posY;
    this.ancho= 100;
    this.alto= 50;
    this.txt= _txt;
  }





  //acciones
  void dibujar() {

    if (estoySobreBoton()) {
      fill(#C4C2C2);
    } else {
      fill(255);
    }

    rectMode(CENTER);
    rect(this.posX, this.posY, this.ancho, this.alto, 5 );
    fill(0);
    textSize(15);
    text(this.txt, this.posX+3, this.posY+5);
  }

  boolean estoySobreBoton() {
    if (mouseX>this.posX && mouseX<this.posX+this.ancho && mouseY>this.posY && mouseY<this.posY + this.alto) {
      return true;
    } else {
      return false;
    }
  }
}
