class Blancanieves {
  //atributos

  PImage blancanieves;

  float posXPj, posYPj, anchoPj, altoPj, posActual;
  float velocidad, limiteSalto, alturaSalto, suelo, limiteDeSalto;
  boolean saltando, bajar, subir, viva;


  //constructores
  Blancanieves() {


    this.blancanieves = loadImage("Blancanieves1.png");

    this.anchoPj = 90;
    this.altoPj = 180;
    this.posXPj = 10;
    this.posYPj = 160;



    this.velocidad = 5;
    this.alturaSalto = 30;
    this.suelo = this.posYPj;

    this.limiteDeSalto = this.alturaSalto ;
    this.subir = true;

    this.viva=true;
  }


  //acciones
  void dibujar() {
    if (viva) {
      image(this.blancanieves, this.posXPj, this.posYPj, this.anchoPj, this.altoPj);
      this.actualizar();
    }
  }

  void actualizar() {

    if (keyPressed && keyCode == UP) {

      this.saltando = true;
      if (saltando ==true) {
      }
    } 
    if (keyPressed && keyCode == LEFT) {
      this.posXPj -= this.velocidad ;
    } 
    if (keyPressed && keyCode == RIGHT) {
      this.posXPj += this.velocidad;
    }  
    if (this.saltando == true) {
      this.logicaDeSalto();
    }
  }

  void logicaDeSalto() {
    if (this.subir == true && this.bajar == false) {
      this.posYPj = this.posYPj-6;
      if (this.posYPj < this.limiteDeSalto) {
        this.bajar  = true;
        this.subir = false;
      }
    } else if (this.subir == false && this.bajar == true) {
      this.posYPj=this.posYPj+6;
      if (this.posYPj >= this.suelo) {
        this.bajar  = false;
        this.subir = true;
        this.saltando = false;
      }
    }
  }

  void perder() {
    viva=false;
  }
}
