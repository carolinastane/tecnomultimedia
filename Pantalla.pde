class Pantalla {
  //atributos

  PFont tipografia;
  String texto;
  color  _colorTexto, fondo;


  //constructores
  Pantalla(String texto, color _colorTexto, color fondo_) {
    this.texto = texto;
    this._colorTexto = _colorTexto;
    this.tipografia = loadFont("titulo.vlw");
    this.fondo= fondo_;
  }



  //acciones

  void dibujar() {
    textFont(this.tipografia);
    background(fondo);
    fill(_colorTexto);
    textSize(20);
    textAlign(CENTER);
    text(this.texto, 250, 150);
  }
}
